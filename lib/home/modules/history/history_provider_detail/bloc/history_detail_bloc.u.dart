import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../models/models.dart';

part 'history_detail_bloc.u.freezed.dart';
part 'history_detail_event.dart';
part 'history_detail_state.dart';

class HistoryProviderDetailBloc
    extends Bloc<HistoryProviderDetailEvent, HistoryProviderDetailState> {
  HistoryProviderDetailBloc(
    this.recordID,
    this.userRepos,
    this.recordRepos,
    this.storeRepos,
  ) : super(const _Initial()) {
    on<HistoryProviderDetailEvent>(_onEvent);
  }
  final String recordID;
  final IStore<AppUser> userRepos;
  final IStore<RepairRecord> recordRepos;
  final StoreRepository storeRepos;
  FutureOr<void> _onEvent(
    HistoryProviderDetailEvent event,
    Emitter<HistoryProviderDetailState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const HistoryProviderDetailState.loading());
        final completer = Completer<Either<StoreFailure, HistoryDetailModel>>();
        final cidFuture = Completer<String>();
        (await recordRepos.get(recordID))
            .fold((l) => const HistoryProviderDetailState.failure(),
                (repairRecord) async {
          cidFuture.complete(repairRecord.cid);
          (await userRepos.get(repairRecord.pid))
              .fold((l) => completer.complete(left(l)), (appUser) async {
            final list = Completer<IList<PaymentService>>();
            final tmp = await storeRepos.repairPaymentRepo(repairRecord).all();
            tmp
                .map<IList<Option<PaymentService>>>(
                  (pmService) => pmService.map(
                    (payment) => payment.maybeMap(
                      orElse: none,
                      paid: some,
                    ),
                  ),
                )
                .map(
                  (r) => r.filter((a) => a.isSome()).map(
                        (a) => a.getOrElse(() => throw NullThrownError()),
                      ),
                )
                .fold(
                  (l) => list.complete(nil()),
                  list.complete,
                );
            final listPaymentService = await list.future;
            final listServiceName =
                listPaymentService.map((a) => a.serviceName).toList();
            final listFee = listPaymentService
                .filter((a) => a.serviceName != 'transFee')
                .map(
                  (a) => a.maybeMap<Option<int>>(
                    orElse: none,
                    paid: (value) => some(
                      value.moneyAmount +
                          (value.products.isEmpty
                              ? 0
                              : (value.products[0].unitPrice *
                                  value.products[0].quantity)),
                    ),
                  ),
                )
                .filter((a) => a.isSome())
                .map(
                  (a) => a.getOrElse(
                    () => throw NullThrownError(),
                  ),
                );
            final totalFee = listFee.toIterable().fold<int>(
                  0,
                  (previousValue, element) => previousValue + element,
                );
            final transFee = listPaymentService
                .filter((a) => a.serviceName == 'transFee')
                .headOption
                .fold(
                  () => 0,
                  (a) => a.maybeMap(
                    paid: (v) => v.moneyAmount,
                    orElse: () => 0,
                  ),
                );

            completer.complete(
              right(
                HistoryDetailModel(
                  isComplete: repairRecord.maybeMap(
                    orElse: () => false,
                    finished: (value) => true,
                  ),
                  orderNumber: repairRecord.id,
                  serviceStartBooking: repairRecord.created,
                  serviceEndBooking: repairRecord.maybeMap(
                    orElse: () => throw NullThrownError(),
                    aborted: (value) => DateTime.now(),
                    finished: (value) => value.completed,
                  ),
                  orderDetailModel: OrderDetailModel(
                    vehicleType: repairRecord.vehicle == 'motorbike' ? 0 : 1,
                    serviceName: listServiceName,
                    address: appUser.addr,
                    totalServiceFee: totalFee,
                    feeTransport: transFee,
                  ),
                  rating: repairRecord.maybeMap(
                    orElse: () => 0,
                    finished: (value) => value.feedback?.rating ?? 0,
                  ),
                  feedback: repairRecord.maybeMap(
                    orElse: () => '',
                    finished: (value) => value.feedback?.desc ?? '',
                  ),
                  provider: appUser,
                ),
              ),
            );
          });
        });
        await cidFuture.future;
        final res = await completer.future;

        res.fold(
          (l) => emit(const HistoryProviderDetailState.failure()),
          (r) => emit(
            HistoryProviderDetailState.success(model: r, cid: recordID),
          ),
        );
      },
    );
  }
}

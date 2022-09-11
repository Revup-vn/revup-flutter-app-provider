import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../models/service_data.dart';

part 'choose_product_bloc.freezed.dart';
part 'choose_product_event.dart';
part 'choose_product_state.dart';

class ChooseProductBloc extends Bloc<ChooseProductEvent, ChooseProductState> {
  ChooseProductBloc(
    this.storeRepository,
    this._repairRecord,
    this._serviceData,
    this.recordId,
    this._userRepos,
  ) : super(const _Initial()) {
    on<ChooseProductEvent>(_onEvent);
  }
  final ServiceData _serviceData;
  final IStore<RepairRecord> _repairRecord;
  final StoreRepository storeRepository;
  final IStore<AppUser> _userRepos;
  final String recordId;
  final productData = <RepairProduct>[];

  FutureOr<void> _onEvent(
    ChooseProductEvent event,
    Emitter<ChooseProductState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const ChooseProductState.loading());
        final maybeRepairRecord = (await _repairRecord.get(recordId))
            .map<Option<RepairRecord>>(
              (r) => r.maybeMap(
                accepted: some,
                started: some,
                orElse: none,
              ),
            )
            .fold<Option<RepairRecord>>(
              (l) => none(),
              (r) => r,
            );
        if (maybeRepairRecord.isNone()) {
          emit(const ChooseProductState.failure());
        } else {
          final repairRecord =
              maybeRepairRecord.getOrElse(() => throw NullThrownError());
          final products = (await storeRepository
                  .repairProductRepo(
                    AppUserDummy.dummyProvider(repairRecord.pid),
                    RepairCategoryDummy.dummy(
                      repairRecord.vehicle == 'car' ? 'Oto' : 'Xe máy',
                    ),
                    RepairServiceDummy.dummy(_serviceData.name),
                  )
                  .where('active', isEqualTo: true))
              .fold<IList<RepairProduct>>((l) => ilist([]), (r) => r)
              .toList();

          productData.addAll(products.toList());

          emit(ChooseProductState.success(products));
        }
      },
      submitted: (groupValue, recordId, onRoute, sendMessage) async {
        emit(const ChooseProductState.loading());
        final maybeRepairRecord = (await _repairRecord.get(recordId))
            .map<Option<RepairRecord>>(
              (r) => r.maybeMap(
                accepted: some,
                started: some,
                orElse: none,
              ),
            )
            .fold<Option<RepairRecord>>(
              (l) => none(),
              (r) => r,
            );
        if (maybeRepairRecord.isNone()) {
          emit(const ChooseProductState.failure());
        } else {
          final repairRecord =
              maybeRepairRecord.getOrElse(() => throw NullThrownError());
          final products = (await storeRepository
                  .repairProductRepo(
                    AppUserDummy.dummyProvider(repairRecord.pid),
                    RepairCategoryDummy.dummy(
                      repairRecord.vehicle == 'car' ? 'Oto' : 'Xe máy',
                    ),
                    RepairServiceDummy.dummy(_serviceData.name),
                  )
                  .where('active', isEqualTo: true))
              .fold<IList<RepairProduct>>((l) => ilist([]), (r) => r)
              .filter(
                (a) => a.name == groupValue,
              );
          if (products.isEmpty) {
            emit(const ChooseProductState.failure());
          } else {
            final selected = products.headOption.getOrElse(
              () => throw NullThrownError(),
            );

            final total = _serviceData.serviceFee + selected.price;

            // await (storeRepository.repairPaymentRepo(
            //   RepairRecordDummy.dummyStarted(recordId),
            // )).update(
            //   PaymentService.pending(
            //     serviceName: _serviceData.name,
            //     moneyAmount: _serviceData.serviceFee,
            //     products: [
            //       PaymentProduct(
            //         name: selected.name,
            //         unitPrice: selected.price,
            //         quantity: 1,
            //       )
            //     ],
            //     isOptional: false,
            //   ),
            // );

            // get latest consumer fcm token
            final consumer = (await _userRepos.get(repairRecord.cid))
                .fold<Option<AppUser>>(
                  (l) => none(),
                  some,
                )
                .getOrElse(() => throw NullThrownError());

            final tokens = (await storeRepository
                    .userNotificationTokenRepo(consumer)
                    .all())
                .map(
                  (r) => r.toList()
                    ..sort(
                      (a, b) => b.created.millisecondsSinceEpoch
                          .compareTo(a.created.millisecondsSinceEpoch),
                    ),
                )
                .fold((l) => throw NullThrownError(), (r) => r);
            sendMessage(
              tokens.first.token,
              _serviceData.name,
              selected.name,
              total.toString(),
            );
            onRoute();
          }
        }
      },
    );
  }
}

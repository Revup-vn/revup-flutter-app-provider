import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../models/models.dart';

part 'select_options_cubit.freezed.dart';
part 'select_options_state.dart';

class SelectOptionsCubit extends Cubit<SelectOptionsState> {
  SelectOptionsCubit(
    this._irs,
    this.repairRepos,
    this.userRepos,
    this.storeRepository,
  ) : super(const SelectOptionsState.initial());
  final IStore<PaymentService> _irs;
  final IStore<RepairRecord> repairRepos;
  final IStore<AppUser> userRepos;
  final StoreRepository storeRepository;

  Future<Unit> fetchUnpaidServices(VoidCallback onError) async {
    emit(const SelectOptionsState.loading());
    (await _irs.all())
        .toOption()
        .map(
          (a) => a
              .filter(
                (a) => a.maybeMap(orElse: () => false, pending: (_) => true),
              )
              .map(
                (a) => a.maybeMap(
                  orElse: () => throw NullThrownError(),
                  pending: (val) => PendingServiceModel(
                    name: val.serviceName,
                    price: val.moneyAmount +
                        ((val.isOptional || val.products.isEmpty)
                            ? 0
                            : val.products
                                .map((e) => e.unitPrice * e.quantity)
                                .reduce((value, element) => value + element)),
                    isOptional: val.isOptional,
                    products: val.products,
                  ),
                ),
              ),
        )
        .fold(onError, (a) => emit(SelectOptionsState.populated(a.toList())));
    return unit;
  }

  Future<void> submitCompleted(
    String rpid,
    Function3<String, String, String, void> sendMessage,
    List<PendingServiceModel> completed,
  ) async {
    emit(const SelectOptionsState.loading());
    final repairRecord = (await repairRepos.get(rpid))
        .map<Option<RepairRecord>>(
          (r) => r.maybeMap(
            started: some,
            orElse: none,
          ),
        )
        .fold<Option<RepairRecord>>(
          (l) => none(),
          (r) => r,
        )
        .getOrElse(() => throw NullThrownError());

    // save list completed
    for (final e in completed) {
      (await _irs.get(e.name)).fold(
        (l) => unit,
        (r) => r
            .maybeMap<Option<PaymentService>>(
              pending: (v) => some(
                PaymentService.pending(
                  serviceName: v.serviceName,
                  moneyAmount: v.moneyAmount,
                  products: v.products,
                  isOptional: v.isOptional,
                  isComplete: true,
                ),
              ),
              orElse: none,
            )
            .traverseFuture((a) async => _irs.update(a)),
      );
    }
    final consumer = (await userRepos.get(repairRecord.cid))
        .fold<Option<AppUser>>(
          (l) => none(),
          some,
        )
        .getOrElse(() => throw NullThrownError());
    final tokens =
        (await storeRepository.userNotificationTokenRepo(consumer).all())
            .map(
              (r) => r.sort(
                orderBy(StringOrder.reverse(), (a) => a.created.toString()),
              ),
            )
            .fold((l) => throw NullThrownError(), (r) => r.toList());
    sendMessage(tokens.first.token, repairRecord.pid, rpid);
  }
}

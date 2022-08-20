import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../models/models.dart';

part 'select_options_cubit.freezed.dart';
part 'select_options_state.dart';

class SelectOptionsCubit extends Cubit<SelectOptionsState> {
  SelectOptionsCubit(this._irs) : super(const SelectOptionsState.initial());
  final IStore<PaymentService> _irs;

  Future<Unit> fetchUnpaidServices(VoidCallback onError) async {
    emit(const SelectOptionsState.loading());
    (await _irs.all())
        .toOption()
        .map(
          (a) => a
              .filter(
                  (a) => a.maybeMap(orElse: () => false, pending: (_) => true))
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
                  ),
                ),
              ),
        )
        .fold(onError, (a) => emit(SelectOptionsState.populated(a.toList())));
    return unit;
  }
}

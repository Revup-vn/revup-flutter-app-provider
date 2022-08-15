import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../../models/models.dart';

part 'p16_finished_order_detail_event.dart';
part 'p16_finished_order_detail_state.dart';
part 'p16_finished_order_detail_bloc.freezed.dart';

class P16FinishedOrderDetailBloc
    extends Bloc<P16FinishedOrderDetailEvent, P16FinishedOrderDetailState> {
  P16FinishedOrderDetailBloc(this._ips)
      : super(const P16FinishedOrderDetailState.initial()) {
    on<P16FinishedOrderDetailEvent>((event, emit) {
      event.when(
        started: () => unit,
        fetchedData: () async => (await _ips.all()).toOption().fold(
              () => emit(const P16FinishedOrderDetailState.loadFailure()),
              (a) => a
                  .filter(
                    (a) => a.maybeMap(
                      orElse: () => true,
                      needToVerify: (_) => false,
                    ),
                  )
                  .map(
                    (a) => a.map(
                      pending: (val) => PendingServiceModel(
                        name: val.serviceName,
                        price: val.moneyAmount +
                            val.products
                                .map((e) => e.quantity * e.unitPrice)
                                .reduce(
                                  (value, element) => value + element,
                                ),
                      ),
                      paid: (val) => PaidServicesModel(
                        name: val.serviceName,
                        price: val.moneyAmount +
                            val.products
                                .map((e) => e.quantity * e.unitPrice)
                                .reduce(
                                  (value, element) => value + element,
                                ),
                      ),
                      needToVerify: (_) => throw NullThrownError(),
                    ),
                  )
                  .partition((a) => a is PaidServicesModel)
                  .apply(
                    (a, b) => emit(
                      P16FinishedOrderDetailState.loadSuccess(
                        requests: b.toList().cast<PendingServiceModel>(),
                        bonuses: a.toList().cast<PaidServicesModel>(),
                      ),
                    ),
                  ),
            ),
      );
    });
  }
  final IStore<PaymentService> _ips;
}

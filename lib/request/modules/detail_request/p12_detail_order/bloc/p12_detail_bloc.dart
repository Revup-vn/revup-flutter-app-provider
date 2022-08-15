import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../../models/models.dart';

part 'p12_detail_event.dart';
part 'p12_detail_state.dart';
part 'p12_detail_bloc.freezed.dart';

class P12DetailBloc extends Bloc<P12DetailEvent, P12DetailState> {
  P12DetailBloc(this._ips) : super(const P12DetailState.initial()) {
    on<P12DetailEvent>(
      (event, emit) {
        event.when(
          submitted: () => unit,
          fetched: () async => (await _ips.all()).toOption().fold(
                () => emit(const P12DetailState.failure()),
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
                        P12DetailState.populated(
                          unpaid: b.toList().cast<PendingServiceModel>(),
                          paid: a.toList().cast<PaidServicesModel>(),
                        ),
                      ),
                    ),
              ),
        );
      },
    );
  }

  final IStore<PaymentService> _ips;
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../../../new_request/models/pending_repair_request.dart';
import '../../../models/pending_service_model.dart';

part 'p10_quote_price_cubit.freezed.dart';
part 'p10_quote_price_state.dart';

class P10QuotePriceCubit extends Cubit<P10QuotePriceState> {
  P10QuotePriceCubit(
    this._paymentService,
    this.record,
    this.pendingService,
    this.pendingAmount,
  ) : super(const _Initial());
  final IStore<PaymentService> _paymentService;
  final PendingRepairRequest record;
  final IList<PendingServiceModel> pendingService;
  final int pendingAmount;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _s;

  Future<Unit> watch() async {
    await _s?.cancel();
    emit(const P10QuotePriceState.loading());
    _s = _paymentService.collection().snapshots().listen(
          _mapDataToStates,
          onError: (Object? _) => emit(const P10QuotePriceState.failure()),
          cancelOnError: true,
        );
    return unit;
  }

  Future<void> _mapDataToStates(QuerySnapshot<Map<String, dynamic>> e) async {
    if (e.size == 0) {
      emit(const P10QuotePriceState.failure());
    } else {
      final services = e.docs
          .map(_paymentService.parseRawData)
          .fold<IList<PaymentService>>(
            nil(),
            (p, e) => e.fold(
              (l) => p,
              (r) => cons(r, p),
            ),
          )
          .map(
            (a) => a.map(
              pending: (v) => PendingServiceModel.fromDto(paymentService: v),
              paid: (v) => PendingServiceModel.fromDto(paymentService: v),
              needToVerify: (v) =>
                  PendingServiceModel.fromDto(paymentService: v),
            ),
          )
          .toList();

      emit(P10QuotePriceState.success(services: services));
    }
  }

  Future<Unit> quotePrice(
    PendingServiceModel needToVerifyModel,
    int price,
  ) async {
    await _paymentService.update(
      PaymentService.pending(
        serviceName: needToVerifyModel.name,
        moneyAmount: price,
        products: [],
        isOptional: true,
      ),
    );
    return unit;
  }

  @override
  Future<void> close() async {
    await _s?.cancel();

    return super.close();
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../../../new_request/models/pending_repair_request.dart';
import '../../../models/need_to_verify_model.dart';
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
      e.docs
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
              pending: (v) => PendingServiceModel(
                name: v.serviceName,
                price: v.moneyAmount +
                    (v.products.isEmpty
                        ? 0
                        : v.products
                            .map((e) => e.quantity * e.unitPrice)
                            .reduce(
                              (value, element) => value + element,
                            )),
                isOptional: v.isOptional,
              ),
              paid: (v) => throw NullThrownError(),
              needToVerify: (v) => NeedToVerifyModel(
                serviceName: v.serviceName,
                desc: v.desc,
              ),
            ),
          )
          .partition((a) => a is NeedToVerifyModel)
          .apply(
        (a, b) {
          emit(
            P10QuotePriceState.success(
              pendingService: b.toList().cast<PendingServiceModel>(),
              needToVerifyService: a.toList().cast<NeedToVerifyModel>(),
            ),
          );
        },
      );
    }
  }

  Unit submit(
    List<NeedToVerifyModel> needToVerify,
    Function0<void> onRoute,
  ) {
    onRoute();
    return unit;
  }

  Future<Unit> quotePrice(
    NeedToVerifyModel needToVerifyModel,
    int price,
  ) async {
    await _paymentService.update(
      PaymentService.pending(
        serviceName: needToVerifyModel.serviceName,
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

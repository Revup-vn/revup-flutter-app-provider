import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../models/pending_service_model.dart';

part 'quote_price_cubit.freezed.dart';
part 'quote_price_state.dart';

class QuotePriceCubit extends Cubit<QuotePriceState> {
  QuotePriceCubit(this._paymentService) : super(QuotePriceState.initial());
  final IStore<PaymentService> _paymentService;
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
}

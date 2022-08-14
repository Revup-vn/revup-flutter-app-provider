import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'pending_service.freezed.dart';

@freezed
class PendingService with _$PendingService {
  const factory PendingService({
    required String serviceName,
    required int moneyAmount,
    required List<PaymentProduct> products,
  }) = _PendingService;

  factory PendingService.fromDto({
    required PaymentService paymentService,
  }) =>
      paymentService.maybeMap(
        pending: (v) => PendingService(
          serviceName: v.serviceName,
          moneyAmount: v.moneyAmount,
          products: v.products,
        ),
        orElse: () => throw NullThrownError(),
      );
}

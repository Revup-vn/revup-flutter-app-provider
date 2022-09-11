part of 'choose_product_bloc.dart';

@freezed
class ChooseProductEvent with _$ChooseProductEvent {
  const factory ChooseProductEvent.started() = _Started;
  const factory ChooseProductEvent.submitted(
    String? groupValue,
    String recordId,
    Function0<void> onRoute,
    Function4<String, String, String, String, void> sendMessage,
  ) = _Submitted;
}

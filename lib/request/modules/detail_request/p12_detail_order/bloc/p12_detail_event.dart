part of 'p12_detail_bloc.dart';

@freezed
class P12DetailEvent with _$P12DetailEvent {
  const factory P12DetailEvent.fetched() = _fetched;
  const factory P12DetailEvent.submitted(Function1<String, void> onRoute) =
      _submitted;
}

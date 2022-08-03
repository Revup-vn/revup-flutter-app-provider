part of 'select_option_complete_bloc.dart';

@freezed
class SelectOptionCompleteState with _$SelectOptionCompleteState {
  const factory SelectOptionCompleteState.initial() = _Initial;
  const factory SelectOptionCompleteState.loading() = _Loading;
  const factory SelectOptionCompleteState.failure() = _Failure;
  const factory SelectOptionCompleteState.success({
    required SelectOptionCompleteModel selectOptionCompleteModel,
  }) = _Success;
}

part of 'select_options_cubit.dart';

@freezed
class SelectOptionsState with _$SelectOptionsState {
  const factory SelectOptionsState.initial() = _Initial;
  const factory SelectOptionsState.loading() = _loading;
  const factory SelectOptionsState.populated(List<PendingServiceModel> data) =
      _populated;
}

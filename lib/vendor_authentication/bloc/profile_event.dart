part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = Started;
  const factory ProfileEvent.submitted(AppUser user) = Submitted;
}

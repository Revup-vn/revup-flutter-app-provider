import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._userRepos,
    this.consumerID,
  ) : super(const _Initial()) {
    on<ProfileEvent>(_onEvent);
  }
  final IStore<AppUser> _userRepos;
  final String consumerID;
  FutureOr<void> _onEvent(
    ProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const ProfileState.loading());

        (await _userRepos.get(consumerID))
            .map(
              (r) => r.maybeMap<Option<AppUser>>(
                orElse: none,
                provider: some,
              ),
            )
            .fold<Option<AppUser>>((l) => none(), (r) => r)
            .fold(
          () => emit(const ProfileState.failure()),
          (aUser) {
            emit(
              ProfileState.loadDataSuccess(
                aUser: aUser,
              ),
            );
          },
        );
      },
      submitted: (user) async {
        emit(const ProfileState.loading());
        final tmp = await _userRepos.updateFields(
          user,
          ilist(
            [
              AppUserDummy.field(AppUserFields.AvatarUrl),
              AppUserDummy.field(AppUserFields.Address),
              AppUserDummy.field(AppUserFields.Background),
              AppUserDummy.field(AppUserFields.Bio),
              AppUserDummy.field(AppUserFields.Dob),
              AppUserDummy.field(AppUserFields.FirstName),
              AppUserDummy.field(AppUserFields.LastName),
            ],
          ),
        );
        final completer = Completer<Either<ProfileState, AppUser>>();
        tmp.fold(
          (l) => emit(const ProfileState.failure()),
          (r) async {
            (await _userRepos.get(consumerID))
                .map(
                  (r) => r.maybeMap<Option<AppUser>>(
                    orElse: none,
                    provider: some,
                  ),
                )
                .fold<Option<AppUser>>((l) => none(), (r) => r)
                .fold(
              () {
                completer.complete(left(const ProfileState.failure()));
              },
              (aUser) {
                completer.complete(right(aUser));
              },
            );
          },
        );
        final res = await completer.future;
        res.fold(
          (l) => emit(l),
          (r) => emit(
            const ProfileState.success(),
          ),
        );
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._userRepos) : super(const _Initial()) {
    on<HomeEvent>(_onEvent);
  }
  final IStore<AppUser> _userRepos;
  Future<void> _onEvent(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const HomeState.loading());
        emit(const HomeState.initial());
      },
      changeActiveStatus: (status, providerID) async {
        final tmp = (await _userRepos.get(providerID))
            .map(
              (r) => r.maybeMap<Option<AppUser>>(
                orElse: none,
                provider: some,
              ),
            )
            .fold<Option<AppUser>>((l) => none(), (r) => r);
        await tmp.fold(
          () => null,
          (a) => a.maybeMap(
            provider: (value) async {
              final tmp = AppUser.provider(
                uuid: value.uuid,
                firstName: value.firstName,
                lastName: value.lastName,
                phone: value.phone,
                dob: value.dob,
                addr: value.addr,
                email: value.email,
                active: value.active,
                avatarUrl: value.avatarUrl,
                createdTime: value.createdTime,
                lastUpdatedTime: value.lastUpdatedTime,
                idCardNum: value.idCardNum,
                idCardImage: value.idCardImage,
                backgroundUrl: value.backgroundUrl,
                bio: value.bio,
                vac: value.vac,
                online: status,
                loc: value.loc,
              );

              final t = await _userRepos.updateFields(
                AppUserDummy.dummyProvider(providerID).copyWith(active: status),
                ilist(
                  [
                    AppUserDummy.field(AppUserFields.Online),
                  ],
                ),
              );
              t.fold(
                (l) => emit(
                  const HomeState.loading(),
                ),
                (r) => emit(
                  HomeState.changeActiveStatusSuccess(
                    status: status,
                    user: tmp,
                  ),
                ),
              );
            },
            orElse: () => throw NullThrownError(),
          ),
        );
      },
    );
  }
}

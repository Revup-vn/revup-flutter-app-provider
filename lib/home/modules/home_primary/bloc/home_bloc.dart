import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:revup_core/core.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._userRepos, this.user) : super(const _Initial()) {
    on<HomeEvent>(_onEvent);
  }
  final IStore<AppUser> _userRepos;
  final AppUser user;
  Future<void> _onEvent(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await event.when(
      started: (lat, lng) async {
        final point = GeoFlutterFire().point(latitude: lat, longitude: lng);
        final data = point.data as Map<String, dynamic>;
        final curLocation = {'cur_location': data};
        await _userRepos.collection().doc(user.uuid).update(curLocation);
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
              final newProvider =
                  AppUserDummy.dummyProvider(providerID).maybeMap(
                orElse: () => throw NullThrownError(),
                provider: (value) => value.copyWith(online: status),
              );
              final t = await _userRepos.updateFields(
                newProvider,
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

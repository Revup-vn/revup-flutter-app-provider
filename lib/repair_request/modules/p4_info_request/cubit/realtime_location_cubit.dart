import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:revup_core/core.dart';

part 'realtime_location_cubit.freezed.dart';
part 'realtime_location_state.dart';

class RealtimeLocationCubit extends Cubit<RealtimeLocationState> {
  RealtimeLocationCubit(this._userStore, this.user)
      : super(const RealtimeLocationState.initial());
  final IStore<AppUser> _userStore;
  StreamSubscription<Position>? _sPosition;
  final AppUser user;
  Future<Unit> watch() async {
    _sPosition = Geolocator.getPositionStream(
            locationSettings:
                const LocationSettings(timeLimit: Duration(seconds: 10)))
        .listen((position) async {
      final point = GeoFlutterFire()
          .point(latitude: position.latitude, longitude: position.longitude);
      final data = point.data as Map<String, dynamic>;
      final curLocation = {'cur_location': data};
      await _userStore.collection().doc(user.uuid).update(curLocation);
    });
    return unit;
  }

  @override
  Future<void> close() async {
    await _sPosition?.cancel();

    return super.close();
  }
}

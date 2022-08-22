import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'permission_cubit.freezed.dart';
part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(const PermissionState.denied());

  // StreamController<bool>? _serviceEnabledController;
  StreamSubscription<ServiceStatus>? _serviceEnabledSubscription;

  Unit onServiceEnabled(Function0<void> onRoute) {
    // _serviceEnabledController ??= StreamController.broadcast();
    _serviceEnabledSubscription =
        Geolocator.getServiceStatusStream().listen((e) {
      final enabled = e == ServiceStatus.enabled;
      enabled ? print('aaaa') : print('bbb');
      // enabled
      //     ? emit(const PermissionState.granted())
      //     : emit(const PermissionState.denied());
    });
    return unit;
  }

  @override
  Future<void> close() {
    _serviceEnabledSubscription?.cancel();
    return super.close();
  }
}

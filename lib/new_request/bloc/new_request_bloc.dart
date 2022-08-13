import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revup_core/core.dart';

import '../../map/map_api/map_api.dart';
import '../../map/models/directions_model.dart';

part 'new_request_bloc.freezed.dart';
part 'new_request_event.dart';
part 'new_request_state.dart';

class NewRequestBloc extends Bloc<NewRequestEvent, NewRequestState> {
  NewRequestBloc(this._repairRecord, this._userStore, this.storeRepository)
      : super(const _Initial()) {
    on<NewRequestEvent>(_onEvent);
  }
  final IStore<AppUser> _userStore;
  final IStore<RepairRecord> _repairRecord;
  final StoreRepository storeRepository;

  FutureOr<void> _onEvent(
    NewRequestEvent event,
    Emitter<NewRequestState> emit,
  ) async {
    await event.when(
      started: () async {
        // TODO(cantgim): get repair record id from message
        final repairRecord =
            (await _repairRecord.get('101f54f8-994c-4610-a68e-747e5e9916d2'))
                .map<Option<RepairRecord>>(
                  (r) => r.maybeMap(
                    pending: (v) => some(r),
                    orElse: none,
                  ),
                )
                .fold(
                  (l) => throw NullThrownError(),
                  (r) => r.getOrElse(
                    () => throw NullThrownError(),
                  ),
                );
        final consumer = (await _userStore.get(repairRecord.cid))
            .fold<Option<AppUser>>(
              (l) => none(),
              some,
            )
            .getOrElse(() => throw NullThrownError());

        final fromLoc = LatLng(repairRecord.from.lat, repairRecord.from.long);
        final toLoc = LatLng(repairRecord.to.lat, repairRecord.to.long);
        final directions = await getDirections(fromLoc, toLoc);
        final toMarker =
            Marker(markerId: const MarkerId('_to'), position: toLoc);
        final fromMarker = Marker(
          markerId: const MarkerId('_from'),
          position: fromLoc,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        );

        final services =
            (await storeRepository.repairPaymentRepo(repairRecord).all())
                .fold((l) => ilist(<PaymentService>[]), (r) => r);
        print(services);
        emit(
          NewRequestState.success(
            directions: directions,
            fromMarker: fromMarker,
            toMarker: toMarker,
            consumer: consumer,
            record: repairRecord,
            services: services,
          ),
        );
      },
    );
  }
}

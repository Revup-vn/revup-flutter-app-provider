import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:revup_core/core.dart';

import '../../map/map_api/map_api.dart';
import '../../map/models/directions_model.dart';
import '../../request/models/pending_service_model.dart';
import '../models/pending_request.dart';

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
                    pending: some,
                    orElse: none,
                  ),
                )
                .fold<Option<RepairRecord>>(
                  (l) => none(),
                  (r) => r,
                )
                .getOrElse(() => throw NullThrownError());
        print(repairRecord);
        final pendingRequest =
            PendingRequest.fromDto(repairRecord: repairRecord);
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
                .map(
                  (r) => r.map<Option<PendingServiceModel>>(
                    (a) => a.maybeMap(
                      pending: (v) =>
                          some(PendingServiceModel.fromDto(paymentService: v)),
                      orElse: none,
                    ),
                  ),
                )
                .fold((l) => ilist(<Option<PendingServiceModel>>[]), (r) => r)
                .filter(
                  (a) => a.isSome(),
                )
                .map(
                  (a) => a.getOrElse(() => throw NullThrownError()),
                );
        final pendingAmount = services
            .map(
              (a) => a.price,
            )
            .foldLeft(pendingRequest.money, (int previous, a) => previous + a);

        emit(
          NewRequestState.success(
            directions: directions,
            fromMarker: fromMarker,
            toMarker: toMarker,
            consumer: consumer,
            record: pendingRequest,
            services: services,
            pendingAmount: pendingAmount,
          ),
        );
      },
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide MapType;
import 'package:map_launcher/map_launcher.dart';
import 'package:revup_core/core.dart';

import '../../l10n/l10n.dart';
import '../../repair_request/modules/p4_info_request/cubit/realtime_location_cubit.dart';
import '../../repair_request/request.dart';
import '../../shared/utils/utils_function.dart';
import '../../shared/widgets/loading.u.dart';
import '../bloc/map_route_bloc.dart';
import '../widgets/request_details_live.dart';
import '../widgets/request_map_live.dart';

class MapRouteView extends StatelessWidget {
  const MapRouteView({
    super.key,
    required this.recordId,
    required this.consumer,
    required this.distance,
    required this.pendingService,
    required this.pendingAmount,
  });
  final String recordId;
  final AppUser consumer;
  final double distance;
  final IList<PendingServiceModel> pendingService;
  final int pendingAmount;
  @override
  Widget build(BuildContext context) {
    final blocPage = context.watch<MapRouteBloc>();
    blocPage.state.whenOrNull(
      initial: () {
        context.read<RealtimeLocationCubit>().watch();
        blocPage.add(const MapRouteEvent.started());
      },
    );
    final user = getUser(context.read<AuthenticateBloc>().state)
        .getOrElse(() => throw NullThrownError());

    return BlocBuilder<MapRouteBloc, MapRouteState>(
      builder: (context, state) {
        return state.maybeWhen(
          success: (directions, fromMaker, toMarker, recordId) {
            return Stack(
              children: <Widget>[
                RequestMapLive(
                  directions: directions,
                  fromMaker: fromMaker,
                  toMarker: toMarker,
                  userStore: context.read(),
                  user: user,
                ),
                Positioned(
                  right: 16,
                  bottom: 128,
                  child: ElevatedButton(
                    onPressed: () {
                      _openMapsFor(
                        fromMaker,
                        toMarker,
                        context.l10n.repairLocationLabel,
                        context.l10n.currentLocationLabel,
                      );
                    },
                    child: const Icon(Icons.navigation_rounded),
                  ),
                ),
                RequestDetailsLive(
                  recordId,
                  consumer,
                  distance,
                  pendingService,
                  pendingAmount,
                ),
              ],
            );
          },
          orElse: Loading.new,
        );
      },
    );
  }

  Future<void> _openMapsFor(
    Marker from,
    Marker to,
    String l1,
    String l2,
  ) async {
    final isGoogle = await MapLauncher.isMapAvailable(MapType.google);

    final isApple = await MapLauncher.isMapAvailable(MapType.apple);
    if (isGoogle ?? false) {
      await MapLauncher.showDirections(
        mapType: MapType.google,
        destination: Coords(to.position.latitude, to.position.longitude),
        origin: Coords(from.position.latitude, from.position.longitude),
        destinationTitle: l1,
        originTitle: l2,
      );
    } else if (isApple ?? false) {
      await MapLauncher.showDirections(
        mapType: MapType.apple,
        destination: Coords(to.position.latitude, to.position.longitude),
        origin: Coords(from.position.latitude, from.position.longitude),
        destinationTitle: l1,
        originTitle: l2,
      );
    }
  }
}

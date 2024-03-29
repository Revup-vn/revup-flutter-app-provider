import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../models/models.dart';

part 'history_provider_bloc.freezed.dart';
part 'history_provider_event.dart';
part 'history_provider_state.dart';

class HistoryProviderBloc
    extends Bloc<HistoryProviderEvent, HistoryProviderState> {
  HistoryProviderBloc(this._irr, this._iau, this.pid)
      : super(const _Initial()) {
    on<HistoryProviderEvent>(_onEventHistory);

    _s = _irr
        .collection()
        .where('pid', isEqualTo: pid)
        .snapshots()
        .listen((event) {
      add(const HistoryProviderEvent.started());
    });
  }

  final IStore<RepairRecord> _irr;
  final IStore<AppUser> _iau;
  final String pid;
  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _s;

  Future<void> _onEventHistory(
    HistoryProviderEvent event,
    Emitter<HistoryProviderState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const HistoryProviderState.loading());

        final mapRecordVsAppUserConsumer = Map.fromEntries(
          (await (await _irr.queryTs(
            (a) => a
                .where(RepairRecordDummy.field(RepairRecordFields.ProviderId),
                    isEqualTo: pid)
                .where(
                  'type',
                  whereIn: [
                    '6', // Finished
                    '3', //Aborted
                  ],
                )
                .orderBy(
                  RepairRecordDummy.field(RepairRecordFields.CreateDate),
                  descending: true,
                )
                .get(),
          ))
                  .toOption()
                  .getOrElse(nil)
                  .traverseFuture(
                    (a) async =>
                        MapEntry(a, (await _iau.get(a.cid)).toOption()),
                  ))
              .filter((a) => a.value.isSome())
              .toIterable(),
        );

        final histories = mapRecordVsAppUserConsumer.entries.map((e) {
          final user = e.value.getOrElse(() => throw NullThrownError());
          return HistoryProviderModel(
            imgUrl: user.avatarUrl,
            orderNumber: e.key.id,
            orderStatus: e.key.maybeMap(
              orElse: () => 0,
              finished: (value) => 1,
            ),
            timeCreated: e.key.created,
            userName: '${user.firstName} ${user.lastName}',
            vehicleType: e.key.vehicle == 'mortobike' ? 0 : 1,
          );
        }).toList()
          ..sort(
            (a, b) => b.timeCreated.millisecondsSinceEpoch
                .compareTo(a.timeCreated.millisecondsSinceEpoch),
          );
        emit(
          HistoryProviderState.success(histories),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _s.cancel();
    return super.close();
  }
}

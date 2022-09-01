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
  HistoryProviderBloc(this._irr, this._iau) : super(const _Initial()) {
    on<HistoryProviderEvent>(_onEventHistory);
  }

  final IStore<RepairRecord> _irr;
  final IStore<AppUser> _iau;

  Future<void> _onEventHistory(
    HistoryProviderEvent event,
    Emitter<HistoryProviderState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const HistoryProviderState.loading());

        // Always return Ilist
        // Error => empty list
        // Order by created Time
        // Senior huy Giai quyet giup em
        final mapRecordVsAppUserConsumer = Map.fromEntries(
          (await (await _irr.queryTs(
            (a) => a
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
              .toIterable(),
        );

        // TODO(tcmhoang): Convert DTO to a newly modified model
        final histories = <HistoryProviderModel>[];

        emit(
          HistoryProviderState.success(histories),
        );
      },
    );
  }
}

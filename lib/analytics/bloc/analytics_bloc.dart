import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'analytics_bloc.freezed.dart';
part 'analytics_event.dart';
part 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc(
    this.providerID,
    this.userRepos,
    this.recordRepos,
  ) : super(const _Initial()) {
    on<AnalyticsEvent>(_onEvent);
  }
  final String providerID;
  final IStore<AppUser> userRepos;
  final IStore<RepairRecord> recordRepos;

  FutureOr<void> _onEvent(
    AnalyticsEvent event,
    Emitter<AnalyticsState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(
          const AnalyticsState.loading(),
        );

        final listRepairRecord =
            (await recordRepos.where('pid', isEqualTo: providerID))
                .map((r) => r)
                .fold<IList<RepairRecord>>((l) => nil(), (r) => r);
        final months = listRepairRecord.map<int>(
          (a) => a.maybeMap(
            orElse: () => 0,
            finished: (value) => value.completed.month,
          ),
        );
        final listMonth =
            ilist([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]).toList();
        final trans = listMonth.map(
          (a) => months.map(
            (b) => a == b ? 1 : 0,
          ),
        );
        final moneyPer = listRepairRecord.map<Tuple2<int, int>>(
          (a) => a.maybeMap(
            orElse: () => tuple2(0, 0),
            finished: (value) => tuple2(value.completed.month, value.money),
          ),
        );
        final money = listMonth.map(
          (e) => moneyPer.map((a) => e == a.value1 ? a.value2 : 0),
        );
        final totalMoney = money
            .map(
              (e) => e.foldLeft<int>(0, (previous, a) => previous + a),
            )
            .toList();
        final totalTrans = trans
            .map(
              (e) => e.foldLeft<int>(0, (previous, a) => previous + a),
            )
            .toList();
        final total = totalMoney.fold<int>(
          0,
          (previousValue, element) => previousValue + element,
        );
        emit(
          AnalyticsState.loadDataSuccess(
            x1: totalMoney,
            x2: totalTrans,
            total: total,
          ),
        );
      },
    );
  }
}

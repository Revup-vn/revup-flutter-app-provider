import 'package:bloc/bloc.dart';
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
    on<AnalyticsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  final String providerID;
  final IStore<AppUser> userRepos;
  final IStore<RepairRecord> recordRepos;
}

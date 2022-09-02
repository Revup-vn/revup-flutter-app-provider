import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'home_primary_cubit.freezed.dart';
part 'home_primary_state.dart';

class HomePrimaryCubit extends Cubit<HomePrimaryState> {
  HomePrimaryCubit(
    this.userRepos,
    this.userId,
  ) : super(const HomePrimaryState.initial());
  final String userId;
  final IStore<AppUser> userRepos;
  Future<Unit> onStarted() async {
    (await userRepos.get(userId)).fold(
      (l) => emit(const HomePrimaryState.loading()),
      (r) => emit(HomePrimaryState.loaded(user: r)),
    );
    return unit;
  }
}

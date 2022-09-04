import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'detail_service_cubit.freezed.dart';
part 'detail_service_state.dart';

class DetailServiceCubit extends Cubit<DetailServiceState> {
  DetailServiceCubit(this.userRepos, this.storeRepos)
      : super(const DetailServiceState.initial());
  final IStore<AppUser> userRepos;
  final StoreRepository storeRepos;
  Future<Unit> changeStatus({
    required bool curStatus,
    required String providerID,
    required String sName,
    required String cate,
  }) async {
    final provider = (await userRepos.get(providerID))
        .getOrElse(() => throw NullThrownError());
    final category =
        (await storeRepos.repairCategoryRepo(provider).get(cate)).getOrElse(
      () => throw NullThrownError(),
    );
    final update =
        await storeRepos.repairServiceRepo(provider, category).updateFields(
              RepairServiceDummy.dummy(sName).copyWith(active: curStatus),
              ilist([
                RepairServiceDummy.field(RepairServiceFields.Active),
              ]),
            );
    update.fold(
      (l) => null,
      (r) => emit(
        DetailServiceState.changeActiveStatusSuccess(status: curStatus),
      ),
    );
    return unit;
  }
}

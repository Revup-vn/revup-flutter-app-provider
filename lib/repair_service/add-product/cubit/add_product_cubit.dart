import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'add_product_cubit.freezed.dart';
part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductCubitState> {
  AddProductCubit(this.userRepos, this.storeRepos)
      : super(const AddProductCubitState.initial());
  final IStore<AppUser> userRepos;
  final StoreRepository storeRepos;
  Future<Unit> changeStatus({
    required bool curStatus,
    required String providerID,
    required String sName,
    required String cate,
    required String pName,
  }) async {
    final provider = (await userRepos.get(providerID))
        .getOrElse(() => throw NullThrownError());
    final category =
        (await storeRepos.repairCategoryRepo(provider).get(cate)).getOrElse(
      () => throw NullThrownError(),
    );
    final service =
        (await storeRepos.repairServiceRepo(provider, category).get(sName))
            .getOrElse(() => throw NullThrownError());
    final update = await storeRepos
        .repairProductRepo(provider, category, service)
        .updateFields(
          RepairProductDummy.dummy(pName).copyWith(active: curStatus),
          ilist([
            RepairProductDummy.field(RepairProductFields.Active),
          ]),
        );
    update.fold(
      (l) => null,
      (r) => emit(
        AddProductCubitState.changeActiveStatusSuccess(status: curStatus),
      ),
    );
    return unit;
  }
}

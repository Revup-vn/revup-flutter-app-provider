import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../models/models.dart';
import '../update_service.dart';

part 'update_service_bloc.freezed.dart';
part 'update_service_event.dart';
part 'update_service_state.dart';

class UpdateServiceBloc extends Bloc<UpdateServiceEvent, UpdateServiceState> {
  UpdateServiceBloc(
    this.providerID,
    this._userRepos,
    this.storeRepository,
    this.category,
    this.serviceName,
  ) : super(const _Initial()) {
    on<UpdateServiceEvent>(_onEvent);
  }
  final IStore<AppUser> _userRepos;
  final StoreRepository storeRepository;
  final String providerID;
  final String category;
  final String serviceName;

  Future<void> _onEvent(
    UpdateServiceEvent event,
    Emitter<UpdateServiceState> emit,
  ) async {
    await event.when(
      deleted: () async {
        final completer = Completer<Either<StoreFailure, Unit>>();
        emit(const UpdateServiceState.loading());
        await (await _userRepos.get(providerID))
            .map(
              (r) => r.maybeMap<Option<AppUser>>(
                orElse: none,
                provider: some,
              ),
            )
            .fold<Option<AppUser>>((l) => none(), (r) => r)
            .fold(
          () => null,
          (aUser) async {
            final tmp = await storeRepository
                .repairCategoryRepo(aUser)
                .where('name', isEqualTo: category);
            tmp.map(
              (r) => r.map(
                (cate) async {
                  final t = await storeRepository
                      .repairServiceRepo(aUser, cate)
                      .delete(serviceName);
                  t.fold(
                    (l) => completer.complete(left(l)),
                    (r) => completer.complete(right(r)),
                  );
                },
              ),
            );
          },
        );
        (await completer.future).fold(
          (l) => emit(const UpdateServiceState.failure()),
          (r) => emit(
            const UpdateServiceState.deleteSuccess(),
          ),
        );
      },
      started: () async {
        final repairService = Completer<UpdateServiceModel>();
        emit(const UpdateServiceState.loading());
        await (await _userRepos.get(providerID))
            .map(
              (r) => r.maybeMap<Option<AppUser>>(
                orElse: none,
                provider: some,
              ),
            )
            .fold<Option<AppUser>>((l) => none(), (r) => r)
            .fold(
          () => null,
          (aUser) async {
            final tmp = await storeRepository
                .repairCategoryRepo(aUser)
                .where('name', isEqualTo: category);
            tmp.map(
              (r) => r.map(
                (cate) async {
                  (await storeRepository
                          .repairServiceRepo(aUser, cate)
                          .where('name', isEqualTo: serviceName))
                      .map(
                    (r) => r.map(
                      (repaiService) async {
                        repairService.complete(
                          UpdateServiceModel(
                            img: repaiService.img ?? '',
                            serviceName: repaiService.name,
                            serviceFee: repaiService.fee,
                            cate: cate.name,
                            active: repaiService.active,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        );
        final res1 = await repairService.future;
        emit(UpdateServiceState.loadDataSuccess(model: res1, pid: providerID));
      },
      submitted: (model, oldName) async {
        final completer = Completer<Either<StoreFailure, Unit>>();
        emit(const UpdateServiceState.loading());
        await (await _userRepos.get(providerID))
            .map(
              (r) => r.maybeMap<Option<AppUser>>(
                orElse: none,
                provider: some,
              ),
            )
            .fold<Option<AppUser>>((l) => none(), (r) => r)
            .fold(
          () => null,
          (aUser) async {
            final tmp = await storeRepository
                .repairCategoryRepo(aUser)
                .where('name', isEqualTo: category);
            tmp.map(
              (r) => r.map(
                (cate) async {
                  (await storeRepository
                          .repairServiceRepo(aUser, cate)
                          .get(oldName))
                      .map(
                    (repairSv) async {
                      final listProduct = (await storeRepository
                              .repairProductRepo(aUser, cate, repairSv)
                              .all())
                          .fold((l) => nil<RepairProduct>(), (r) => r);
                      final t = await storeRepository
                          .repairServiceRepo(aUser, cate)
                          .update(
                            RepairService(
                              name: model.serviceName,
                              fee: model.serviceFee,
                              img: model.img,
                              active: model.active,
                            ),
                            RepairServiceDummy.dummy(oldName),
                          );

                      t.fold(
                          (l) => completer.complete(
                                left(l),
                              ), (r) async {
                        await Future.wait(
                          listProduct.map((a) async {
                            final ttttttt =
                                await (storeRepository.repairProductRepo(
                              aUser,
                              cate,
                              RepairServiceDummy.dummy(model.serviceName),
                            )).create(a);
                            return ttttttt;
                          }).toList(),
                        );
                        completer.complete(
                          right(r),
                        );
                      });
                    },
                  );
                },
              ),
            );
          },
        );
        (await completer.future).fold(
          (l) => emit(const UpdateServiceState.failure()),
          (r) => emit(
            const UpdateServiceState.sumbitSuccess(),
          ),
        );
      },
    );
  }
}

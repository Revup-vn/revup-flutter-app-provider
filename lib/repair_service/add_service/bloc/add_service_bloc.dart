import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../add_service.dart';

part 'add_service_bloc.freezed.dart';
part 'add_service_event.dart';
part 'add_service_state.dart';

class AddServiceBloc extends Bloc<AddServiceEvent, AddServiceState> {
  AddServiceBloc(
    this.providerID,
    this._userRepos,
    this.storeRepository,
  ) : super(const _Initial()) {
    on<AddServiceEvent>(_onEvent);
  }
  final IStore<AppUser> _userRepos;
  final StoreRepository storeRepository;
  final String providerID;
  FutureOr<void> _onEvent(
    AddServiceEvent event,
    Emitter<AddServiceState> emit,
  ) async {
    await event.when(
      started: () async => emit(const AddServiceState.initial()),
      submitted: (data) async {
        final completer = Completer<Either<StoreFailure, Unit>>();
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
                .where('name', isEqualTo: data.cate);
            tmp.map(
              (r) async {
                if (r.length() == 0) {
                  await storeRepository.repairCategoryRepo(aUser).create(
                        RepairCategory(
                          name: 'Xe máy',
                          created: DateTime.now(),
                          updated: DateTime.now(),
                        ),
                      );
                  await storeRepository.repairCategoryRepo(aUser).create(
                        RepairCategory(
                          name: 'Oto',
                          created: DateTime.now(),
                          updated: DateTime.now(),
                        ),
                      );
                  final temp = await storeRepository
                      .repairCategoryRepo(aUser)
                      .where('name', isEqualTo: data.cate);
                  temp.map(
                    (r) => r.map(
                      (cate) async {
                        if (cate.name != 'Xe máy' && cate.name != 'Oto') {
                          await storeRepository
                              .repairCategoryRepo(aUser)
                              .create(
                                RepairCategory(
                                  name: 'Xe máy',
                                  created: DateTime.now(),
                                  updated: DateTime.now(),
                                ),
                              );
                          await storeRepository
                              .repairCategoryRepo(aUser)
                              .create(
                                RepairCategory(
                                  name: 'Oto',
                                  created: DateTime.now(),
                                  updated: DateTime.now(),
                                ),
                              );
                        }
                        final res = await storeRepository
                            .repairServiceRepo(aUser, cate)
                            .create(
                              RepairService(
                                name: data.serviceName,
                                fee: data.serviceFee,
                                img: data.img,
                              ),
                            );
                        res.fold(
                          (l) => completer.complete(left(l)),
                          (r) => completer.complete(
                            right(r),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return r.map(
                    (cate) async {
                      if (cate.name != 'Xe máy' && cate.name != 'Oto') {
                        await storeRepository.repairCategoryRepo(aUser).create(
                              RepairCategory(
                                name: 'Xe máy',
                                created: DateTime.now(),
                                updated: DateTime.now(),
                              ),
                            );
                        await storeRepository.repairCategoryRepo(aUser).create(
                              RepairCategory(
                                name: 'Oto',
                                created: DateTime.now(),
                                updated: DateTime.now(),
                              ),
                            );
                      }
                      final res = await storeRepository
                          .repairServiceRepo(aUser, cate)
                          .create(
                            RepairService(
                              name: data.serviceName,
                              fee: data.serviceFee,
                              img: data.img,
                            ),
                          );
                      res.fold(
                        (l) => completer.complete(left(l)),
                        (r) => completer.complete(
                          right(r),
                        ),
                      );
                    },
                  );
                }
              },
            );
          },
        );
        final updated = await completer.future;
        updated.fold(
          (l) => emit(const AddServiceState.failure()),
          (r) => emit(
            const AddServiceState.addServiceSuccess(),
          ),
        );
      },
    );
  }
}

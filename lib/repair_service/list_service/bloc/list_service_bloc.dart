import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../shared/extension.dart';
import '../models/service_model.dart';

part 'list_service_bloc.freezed.dart';
part 'list_service_event.dart';
part 'list_service_state.dart';

class ListServiceBloc extends Bloc<ListServiceEvent, ListServiceState> {
  ListServiceBloc(
    this.providerID,
    this._userRepos,
    this.storeRepository,
  ) : super(const _Initial()) {
    on<ListServiceEvent>(_onEvent);
  }
  final String providerID;
  final IStore<AppUser> _userRepos;
  final StoreRepository storeRepository;

  FutureOr<void> _onEvent(
    ListServiceEvent event,
    Emitter<ListServiceState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const ListServiceState.loading());
        final data = Completer<List<ServiceModel>>();
        (await _userRepos.get(providerID))
            .map(
              (r) => r.maybeMap<Option<AppUser>>(
                orElse: none,
                provider: some,
              ),
            )
            .fold<Option<AppUser>>((l) => none(), (r) => r)
            .fold(
          () => emit(const ListServiceState.failure()),
          (aUser) async {
            final tmp = await (storeRepository.repairCategoryRepo(aUser))
                .where('name', isEqualTo: 'Xe máy');
            tmp.fold((l) => emit(const ListServiceState.failure()), (r) async {
              if (r.length() == 0) {
                data.complete(<ServiceModel>[]);
              }
              r.map(
                (repairCate) async {
                  final listService = await storeRepository
                      .repairServiceRepo(aUser, repairCate)
                      .all();
                  final listS = listService
                      .map<IList<RepairService>>((r) => r)
                      .fold<IList<RepairService>>((l) => nil(), (r) => r)
                      .map(
                    (repairService) async {
                      final t = await storeRepository
                          .repairProductRepo(aUser, repairCate, repairService)
                          .all();
                      final listProduct =
                          t.fold<IList<RepairProduct>>((l) => nil(), (r) => r);
                      final list = listProduct
                          .sortByDouble(
                            (e1, e2) => e1.price.compareTo(e2.price),
                          )
                          .toList();
                      if (list.isNotEmpty && list.length >= 2) {
                        final hp = list.first.price;
                        final lp = list.last.price;
                        return ServiceModel(
                          serviceName: repairService.name,
                          sortType: 0,
                          price:
                              '''${lp + repairService.fee} - ${hp + repairService.fee}''',
                          imageUrl: repairService.img ?? '',
                        );
                      } else if (list.length == 1) {
                        final price = list.last.price + repairService.fee;
                        return ServiceModel(
                          serviceName: repairService.name,
                          sortType: 0,
                          price: price.toString(),
                          imageUrl: repairService.img ?? '',
                        );
                      } else {
                        return ServiceModel(
                          serviceName: repairService.name,
                          sortType: 0,
                          price: repairService.fee.toString(),
                          imageUrl: repairService.img ?? '',
                        );
                      }
                    },
                  );
                  final listServiceModel = await Future.wait(
                    listS.map((a) async => a).toIterable(),
                  );
                  data.complete(listServiceModel);
                },
              );
            });
          },
        );
        final res = await data.future;
        res.isNotEmpty
            ? emit(
                ListServiceState.loadDataSuccess(
                  data: ilist(res),
                  sortType: 0,
                  providerID: providerID,
                ),
              )
            : emit(
                ListServiceState.empty(
                  data: ilist(res),
                  sortType: 0,
                  providerID: providerID,
                ),
              );
      },
      sortTypeChanged: (sortType) async {
        emit(const ListServiceState.loading());
        final data = Completer<List<ServiceModel>>();
        (await _userRepos.get(providerID))
            .map(
              (r) => r.maybeMap<Option<AppUser>>(
                orElse: none,
                provider: some,
              ),
            )
            .fold<Option<AppUser>>((l) => none(), (r) => r)
            .fold(
          () => emit(const ListServiceState.failure()),
          (aUser) async {
            final type = sortType == 0 ? 'Xe máy' : 'Oto';
            final tmp = await (storeRepository.repairCategoryRepo(aUser))
                .where('name', isEqualTo: type);
            tmp.fold(
              (l) => emit(const ListServiceState.failure()),
              (r) async {
                if (r.length() <= 0) {
                  data.complete([]);
                } else {
                  r.map(
                    (repairCate) async {
                      final listService = await storeRepository
                          .repairServiceRepo(aUser, repairCate)
                          .all();
                      final listS = listService
                          .map<IList<RepairService>>((r) => r)
                          .fold<IList<RepairService>>((l) => nil(), (r) => r)
                          .map(
                        (repairService) async {
                          final t = await storeRepository
                              .repairProductRepo(
                                aUser,
                                repairCate,
                                repairService,
                              )
                              .all();
                          final listProduct = t.fold<IList<RepairProduct>>(
                            (l) => nil(),
                            (r) => r,
                          );
                          final list = listProduct
                              .sortByDouble(
                                (e1, e2) => e1.price.compareTo(e2.price),
                              )
                              .toList();
                          if (list.isNotEmpty && list.length >= 2) {
                            final hp = list.first.price;
                            final lp = list.last.price;
                            return ServiceModel(
                              serviceName: repairService.name,
                              sortType: 0,
                              price:
                                  '''${lp + repairService.fee} - ${hp + repairService.fee}''',
                              imageUrl: repairService.img ?? '',
                            );
                          } else if (list.length == 1) {
                            final price = list.first.price + repairService.fee;
                            return ServiceModel(
                              serviceName: repairService.name,
                              sortType: 0,
                              price: price.toString(),
                              imageUrl: repairService.img ?? '',
                            );
                          } else {
                            return ServiceModel(
                              serviceName: repairService.name,
                              sortType: 0,
                              price: repairService.fee.toString(),
                              imageUrl: repairService.img ?? '',
                            );
                          }
                        },
                      );
                      final listServiceModel = await Future.wait(
                        listS.map((a) async => a).toIterable(),
                      );
                      data.complete(listServiceModel);
                    },
                  );
                }
              },
            );
          },
        );
        final res = await data.future;
        res.isNotEmpty
            ? emit(
                ListServiceState.loadDataSuccess(
                  data: ilist(res),
                  sortType: sortType,
                  providerID: providerID,
                ),
              )
            : emit(
                ListServiceState.empty(
                  data: ilist(res),
                  sortType: sortType,
                  providerID: providerID,
                ),
              );
      },
    );
  }
}

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
            final listDataModel = tmp.fold(
              (l) => emit(const ListServiceState.failure()),
              (r) async => r.map(
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
                      if (list.isNotEmpty) {
                        final hp = list.last.price;
                        final lp = list.first.price;
                        return ServiceModel(
                          providerID: providerID,
                          serviceName: repairService.name,
                          sortType: 0,
                          price:
                              '''${lp + repairService.fee}đ - ${hp + repairService.fee}đ''',
                          imageUrl: repairService.img ?? '',
                        );
                      } else {
                        return ServiceModel(
                          providerID: providerID,
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
              ),
            );
          },
        );
        final res = await data.future;
        emit(ListServiceState.loadDataSuccess(data: ilist(res), sortType: 0));
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
            final listDataModel = tmp.fold(
              (l) => emit(const ListServiceState.failure()),
              (r) async => r.map(
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
                      if (list.isNotEmpty) {
                        final hp = list.last.price;
                        final lp = list.first.price;
                        return ServiceModel(
                          providerID: providerID,
                          serviceName: repairService.name,
                          sortType: 0,
                          price:
                              '''${lp + repairService.fee}đ - ${hp + repairService.fee}đ''',
                          imageUrl: repairService.img ?? '',
                        );
                      } else {
                        return ServiceModel(
                          providerID: providerID,
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
              ),
            );
          },
        );
        final res = await data.future;
        emit(
          ListServiceState.loadDataSuccess(
            data: ilist(res),
            sortType: sortType,
          ),
        );
      },
    );
  }
}

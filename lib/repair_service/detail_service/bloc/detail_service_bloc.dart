import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'detail_service_bloc.freezed.dart';
part 'detail_service_event.dart';
part 'detail_service_state.dart';

class DetailServiceBloc extends Bloc<DetailServiceEvent, DetailServiceState> {
  DetailServiceBloc(
    this.providerID,
    this._userRepos,
    this.storeRepository,
    this.category,
    this.serviceName,
    this.serviceRepos,
    this.productRepos,
  ) : super(const _Initial()) {
    on<DetailServiceEvent>(_onEvent);
    _s = serviceRepos.collection().snapshots().listen((event) {
      add(const DetailServiceEvent.started());
    });
    _s2 = productRepos.collection().snapshots().listen((event) {
      add(const DetailServiceEvent.started());
    });
  }
  final IStore<AppUser> _userRepos;
  final StoreRepository storeRepository;
  final String providerID;
  final String category;
  final String serviceName;
  final IStore<RepairService> serviceRepos;
  final IStore<RepairProduct> productRepos;
  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _s;
  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _s2;

  Future<void> _onEvent(
    DetailServiceEvent event,
    Emitter<DetailServiceState> emit,
  ) async {
    await event.when(
      started: () async {
        final repairService = Completer<RepairService>();
        final repairProducts = Completer<IList<RepairProduct>>();
        emit(const DetailServiceState.loading());
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
                        (await storeRepository
                                .repairProductRepo(aUser, cate, repaiService)
                                .all())
                            .map((r) {
                          repairService.complete(repaiService);
                          repairProducts.complete(r);
                        });
                      },
                    ),
                  );
                },
              ),
            );
          },
        );
        final res1 = await repairService.future;
        final res2 = await repairProducts.future;

        emit(
          DetailServiceState.loadDataSuccess(
            rpService: res1,
            rpProduct: res2,
            cate: category,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _s.cancel();
    await _s2.cancel();
    return super.close();
  }
}

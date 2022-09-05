import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../models/myservicedata.dart';
import '../models/recentorderdata.dart';

part 'home_primary_cubit.freezed.dart';
part 'home_primary_state.dart';

class HomePrimaryCubit extends Cubit<HomePrimaryState> {
  HomePrimaryCubit(
    this.userRepos,
    this.userId,
    this.recordRepos,
    this.storeRepos,
  ) : super(
          HomePrimaryState.initial(
            ads: IVector.from([
              'https://www.tiendauroi.com/wp-content/uploads/2020/02/shopee-freeship-xtra-750x233.jpg',
              'https://e-magazine.asiamedia.vn/wp-content/uploads/2021/07/top-10-hang-dau-nhot-noi-tieng-nhat-tai-viet-nam-21.jpg',
              'https://www.tiendauroi.com/wp-content/uploads/2020/02/shopee-freeship-xtra-750x233.jpg',
              'https://e-magazine.asiamedia.vn/wp-content/uploads/2021/07/top-10-hang-dau-nhot-noi-tieng-nhat-tai-viet-nam-21.jpg',
            ]),
          ),
        );
  final String userId;
  final IStore<AppUser> userRepos;
  final IStore<RepairRecord> recordRepos;
  final StoreRepository storeRepos;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _s;
  final imageList = IVector.from([
    'https://www.tiendauroi.com/wp-content/uploads/2020/02/shopee-freeship-xtra-750x233.jpg',
    'https://e-magazine.asiamedia.vn/wp-content/uploads/2021/07/top-10-hang-dau-nhot-noi-tieng-nhat-tai-viet-nam-21.jpg',
    'https://www.tiendauroi.com/wp-content/uploads/2020/02/shopee-freeship-xtra-750x233.jpg',
    'https://e-magazine.asiamedia.vn/wp-content/uploads/2021/07/top-10-hang-dau-nhot-noi-tieng-nhat-tai-viet-nam-21.jpg',
  ]);
  Future<Unit> onStarted() async {
    _s = userRepos.collection().snapshots().listen((event) async {
      final user = (await userRepos.get(userId))
          .getOrElse(() => throw NullThrownError());
      final listRecentOrder =
          (await recordRepos.where('pid', isEqualTo: userId))
              .map((r) => r)
              .fold<IList<RepairRecord>>(
                (l) => nil<RepairRecord>(),
                (r) => r.sort(
                  orderBy(
                    StringOrder.reverse(),
                    (a) => a.created.toString(),
                  ),
                ),
              );
      final listSv = (await storeRepos.repairCategoryRepo(user).all()).map(
        (r) => r.map(
          (a) async => (await storeRepos.repairServiceRepo(user, a).all())
              .fold((l) => nil<RepairService>(), (r) => r),
        ),
      );
      final l = await listSv.fold<Future<List<IList<RepairService>>>>(
        (l) async => Future.wait(nil<Future<IList<RepairService>>>().toList()),
        (r) async => Future.wait(
          r.toList(),
        ),
      );
      final data = l
          .fold<IList<RepairService>>(
            l.toList()[0],
            (previousValue, element) => previousValue.plus(element),
          )
          .map(
            (sv) => MyServiceData(
              fee: sv.fee,
              imgUrl: sv.img ?? '',
              name: sv.name,
              isActive: sv.active,
            ),
          );
      final list = listRecentOrder.toList();
      if (list.isEmpty) {
        emit(
          HomePrimaryState.recentOrderEmpty(
            user: user,
            ads: imageList,
            listService: data.toList(),
          ),
        );
      } else {
        final consumer = (await userRepos.get(list[0].cid))
            .getOrElse(() => throw NullThrownError());
        final rc = RecentOrderData(
          created: list[0].created,
          imageUrl: consumer.avatarUrl,
          providerName: '${consumer.firstName} ${consumer.lastName}',
          rating: list[0].maybeMap(
            orElse: () => 0,
            finished: (value) => value.feedback.rating,
          ),
          serviceType: list[0].vehicle == 'motorbike' ? 0 : 1,
        );
        emit(
          HomePrimaryState.loaded(
            user: user,
            recentOrder: rc,
            listService: data.toList(),
            ads: imageList,
          ),
        );
      }
    });

    return unit;
  }
}

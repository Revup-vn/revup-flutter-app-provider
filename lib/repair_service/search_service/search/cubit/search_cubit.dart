import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';
import 'package:tiengviet/tiengviet.dart';

import '../../models/servicerawdata.dart';

part 'search_cubit.freezed.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.providerID,
    this.userRepos,
    this.storeRepos,
  ) : super(const SearchState.initial());
  final String providerID;
  final IStore<AppUser> userRepos;
  final StoreRepository storeRepos;
  StreamSubscription<List<DocumentSnapshot<Object?>>>? _s;

  Future<Unit> searchByKeyword(
    String keyword,
    int type,
    String svName,
    int cate,
  ) async {
    emit(const SearchState.loading());
    final user = (await userRepos.get(providerID))
        .getOrElse(() => throw NullThrownError());
    final listCate = (await storeRepos.repairCategoryRepo(user).all())
        .fold((l) => nil<RepairCategory>(), (r) => r);
    final t = listCate.map(
      (cate) async => (await storeRepos.repairServiceRepo(user, cate).all())
          .fold<Tuple2<IList<RepairService>, RepairCategory>>(
        (l) => tuple2(nil(), cate),
        (r) => tuple2(r, cate),
      ),
    );
    final tt = await Future.wait(t.toList());
    final ttt = ilist(
      tt.map(
        (e) => e.value1.map(
          (a) => tuple2(a, e.value2),
        ),
      ),
    ).foldLeft<IList<Tuple2<RepairService, RepairCategory>>>(
      nil(),
      (previous, a) => previous.plus(a),
    );
    if (type == 0) {
      final tttt = ttt.where(
        (a) => TiengViet.parse(a.value1.name).toLowerCase().startsWith(
              TiengViet.parse(keyword).toLowerCase(),
            ),
      );
      emit(
        SearchState.result(
          keyword: keyword,
          resultCount: tttt.length(),
          type: type,
          results: tttt
              .map(
                (a) => ServiceRawData.service(
                  name: a.value1.name,
                  imgUrl: a.value1.img ?? '',
                  feeRange: a.value1.fee.toString(),
                  cate: a.value2.name == 'Xe máy' ? 0 : 1,
                ),
              )
              .toList(),
          providerId: providerID,
        ),
      );
    } else {
      final tttt = ttt.where((a) => a.value1.name == svName);
      final cateName = cate == 0 ? 'Xe máy' : 'Oto';
      final listCate = (await storeRepos.repairCategoryRepo(user).all())
          .fold((l) => nil<RepairCategory>(), (r) => r)
          .where(
            (a) => a.name == cateName,
          );
      if (listCate.isEmpty) {
        emit(SearchState.empty(keyword: keyword, resultCount: 0));
      } else {
        tttt.map(
          (tp) async => (await storeRepos
                  .repairProductRepo(user, listCate.toList()[0], tp.value1)
                  .all())
              .fold(
                  (l) =>
                      emit(SearchState.empty(keyword: keyword, resultCount: 0)),
                  (r) {
            final finalData = r
                .where(
                  (a) => TiengViet.parse(a.name).toLowerCase().startsWith(
                        TiengViet.parse(keyword).toLowerCase(),
                      ),
                )
                .map(
                  (a) => ServiceRawData.product(
                    name: a.name,
                    imgUrl: a.img,
                    fee: a.price,
                    cate: tp.value2.name == 'Xe máy' ? 0 : 1,
                    sName: tp.value1.name,
                  ),
                );
            emit(
              SearchState.result(
                keyword: keyword,
                resultCount: finalData.toList().length,
                type: type,
                results: finalData.toList(),
                providerId: providerID,
              ),
            );
          }),
        );
      }
    }
    return unit;
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../models/commonservice.dart';

part 'common_service_bloc.freezed.dart';
part 'common_service_event.dart';
part 'common_service_state.dart';

class CommonServiceBloc extends Bloc<CommonServiceEvent, CommonServiceState> {
  CommonServiceBloc(
    this.providerID,
    this.sortType,
    this.storageBloc,
    this.userRepos,
    this.repoRepos,
  ) : super(const _Initial()) {
    on<CommonServiceEvent>(_onEvent);
  }
  final String providerID;
  final int sortType;
  final StorageBloc storageBloc;
  final IStore<AppUser> userRepos;
  final StoreRepository repoRepos;

  FutureOr<void> _onEvent(
    CommonServiceEvent event,
    Emitter<CommonServiceState> emit,
  ) async {
    await event.when(
      started: () async {
        emit(const CommonServiceState.loading());
        final data = await readJson();
        final cate = data['category'] as List<dynamic>;
        final categoriesList = ((json.decode(json.encode(cate[sortType]))
                as Map<String, dynamic>)['service'] as List)
            .cast<Map<String, dynamic>>();
        final listServiceCate = categoriesList
            .map(
              (e) => CommonService.fromDto(
                RepairService(
                  name: e['name'].toString(),
                  fee: int.parse(e['fee'].toString()),
                  img: e['img'].toString(),
                ),
                (e['product'] as List).cast<Map<String, dynamic>>(),
              ),
            )
            .toList();

        emit(
          CommonServiceState.success(
            list: listServiceCate,
            providerID: providerID,
          ),
        );
      },
      submited: (
        saveLst,
      ) async {
        emit(const CommonServiceState.loading());
        final finalRes = saveLst.map(
          (t4) async {
            return tuple3(
              t4.value1,
              await Future.wait(
                t4.value2.map(
                  (t2) async {
                    if (t2.value2.path.isNotEmpty) {
                      final imgData = Completer<String>();
                      await uploadImg(
                        file: StorageFile.profile(
                          file: t2.value2,
                        ),
                        emit: emit,
                        completer: imgData,
                      );
                      final t = await imgData.future;
                      final x = t.isNotEmpty ? t : t2.value1.img;
                      return RepairProduct(
                        name: t2.value1.name,
                        desc: t2.value1.desc,
                        img: x,
                        price: t2.value1.price,
                      );
                    } else {
                      return t2.value1;
                    }
                  },
                ),
              ),
              t4.value3,
            );
          },
        );
        final a = await Future.wait(finalRes);
        final b = a.map(
          (tp3) async {
            if (tp3.value3.path.isNotEmpty) {
              final imgDt = Completer<String>();
              await uploadImg(
                file: StorageFile.profile(file: tp3.value3),
                emit: emit,
                completer: imgDt,
              );
              final t = await imgDt.future;
              return CommonService(
                sName: tp3.value1.sName,
                sFee: tp3.value1.sFee,
                sImg: t.isNotEmpty ? t : tp3.value1.sImg,
                products: tp3.value2,
              );
            } else {
              return tp3.value1;
            }
          },
        );
        final listCommonService = await Future.wait(b);
        final provider = (await userRepos.get(providerID))
            .getOrElse(() => throw NullThrownError());
        (await repoRepos.repairCategoryRepo(provider).all()).map(
          (r) async {
            final cate = sortType == 0 ? 'Xe máy' : 'Oto';
            final hasCate = r.any((a) => a.name == cate);
            if (!hasCate) {
              await repoRepos.repairCategoryRepo(provider).create(
                    RepairCategory(
                      name: cate,
                      created: DateTime.now(),
                      updated: DateTime.now(),
                    ),
                  );
            }
            final rpC = (await repoRepos.repairCategoryRepo(provider).get(cate))
                .getOrElse(() => throw NullThrownError());
            ilist(listCommonService).map(
              (cmS) async {
                final t =
                    await repoRepos.repairServiceRepo(provider, rpC).create(
                          RepairService(
                            name: cmS.sName,
                            fee: cmS.sFee,
                            img: cmS.sImg,
                          ),
                        );
                t.fold(
                  (l) => emit(const CommonServiceState.failure()),
                  (unit) async {
                    final rpService = (await repoRepos
                            .repairServiceRepo(provider, rpC)
                            .get(cmS.sName))
                        .getOrElse(
                      () => throw NullThrownError(),
                    );
                    ilist(cmS.products).map((rpProduct) async {
                      await repoRepos
                          .repairProductRepo(
                            provider,
                            rpC,
                            rpService,
                          )
                          .create(rpProduct);
                    });
                  },
                );
              },
            );
          },
        );
        emit(
          const CommonServiceState.submitSuccess(),
        );
      },
    );
  }

  Future<Map<String, dynamic>> readJson() async {
    final response = await rootBundle.loadString('assets/common_service.json');
    final data = json.decode(response) as Map<String, dynamic>;
    return data;
  }

  Future<Unit> uploadImg({
    required StorageFile file,
    required Emitter<CommonServiceState> emit,
    required Completer<String> completer,
  }) async {
    final isDoneLogin = Completer<Unit>();
    storageBloc.add(StorageEvent.upload(file: file));
    await _listenOnce(
      isDoneLogin,
      (event) async => event.maybeWhen(
        orElse: () => false,
        success: (eitherFailuresOrUrls) => eitherFailuresOrUrls.map(
          (a) => a.fold(
            (l) => emit(const CommonServiceState.failure()),
            (newImgUrl) => completer.complete(newImgUrl),
          ),
        ),
      ),
    );

    return unit;
  }

  Future<Unit> _listenOnce(
    Completer<Unit> isDone,
    Function1<StorageState, void> map,
  ) async {
    final _tmp = storageBloc.stream.listen(
      (event) {
        map(event);
        event.maybeMap(
          success: (value) => isDone.complete(unit),
          orElse: () => unit,
        );
      },
    );
    await isDone.future;
    await _tmp.cancel();

    return unit;
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../models/add_product_model.dart';

part 'add_product_bloc.freezed.dart';
part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductBloc(
    this.providerID,
    this._userRepos,
    this.storeRepository,
    this.cate,
    this.sName,
    this.pName,
  ) : super(const _Initial()) {
    on<AddProductEvent>(_onEvent);
  }
  final IStore<AppUser> _userRepos;
  final StoreRepository storeRepository;
  final String providerID;
  final String cate;
  final String sName;
  final String pName;

  FutureOr<void> _onEvent(
    AddProductEvent event,
    Emitter<AddProductState> emit,
  ) async {
    await event.when(
      deleteProduct: () async {
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
                .where('name', isEqualTo: cate);
            tmp.map(
              (r) => r.map(
                (cate) async {
                  (await storeRepository
                          .repairServiceRepo(aUser, cate)
                          .where('name', isEqualTo: sName))
                      .map(
                    (r) => r.map(
                      (repaiService) async {
                        (await storeRepository
                                .repairProductRepo(aUser, cate, repaiService)
                                .where('name', isEqualTo: pName))
                            .map(
                          (r) => r.map((product) async {
                            final t = await storeRepository
                                .repairProductRepo(aUser, cate, repaiService)
                                .delete(pName);
                            t.fold(
                              (l) => completer.complete(left(l)),
                              (r) => completer.complete(
                                right(r),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        );
        (await completer.future).fold(
          (l) => emit(const AddProductState.failure()),
          (r) => emit(
            const AddProductState.addServiceSuccess(),
          ),
        );
      },
      started: (type) async {
        emit(const AddProductState.loading());
        final completer = Completer<AddProductModel>();
        if (type == 0) {
          emit(
            AddProductState.loadDataSuccess(
              model: AddProductModel(
                imageUrl: '',
                productName: '',
                productFee: 0,
                des: '',
                cate: cate,
                sName: sName,
                isActive: true,
              ),
              cate: cate,
              providerID: providerID,
              sName: sName,
            ),
          );
        } else {
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
                  .where('name', isEqualTo: cate);
              tmp.map(
                (r) => r.map(
                  (cate) async {
                    (await storeRepository
                            .repairServiceRepo(aUser, cate)
                            .where('name', isEqualTo: sName))
                        .map(
                      (r) => r.map(
                        (repaiService) async {
                          (await storeRepository
                                  .repairProductRepo(aUser, cate, repaiService)
                                  .where('name', isEqualTo: pName))
                              .map(
                            (r) => r.map(
                              (a) => completer.complete(
                                AddProductModel(
                                  imageUrl: a.img,
                                  productName: a.name,
                                  productFee: a.price,
                                  des: a.desc,
                                  cate: cate.name,
                                  sName: sName,
                                  isActive: a.active,
                                ),
                              ),
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
          final res = await completer.future;
          emit(
            AddProductState.loadDataSuccess(
              model: res,
              cate: cate,
              providerID: providerID,
              sName: sName,
            ),
          );
        }
      },
      submitted: (data, type) async {
        final completer = Completer<Either<StoreFailure, Unit>>();
        if (type == 0) {
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
                  .where('name', isEqualTo: cate);
              tmp.map(
                (r) => r.map(
                  (cate) async {
                    (await storeRepository
                            .repairServiceRepo(aUser, cate)
                            .where('name', isEqualTo: sName))
                        .map(
                      (r) => r.map(
                        (repaiService) async {
                          final newProduct = RepairProduct(
                            name: data.productName,
                            desc: data.des,
                            img: data.imageUrl,
                            price: data.productFee,
                          );
                          final t = await storeRepository
                              .repairProductRepo(aUser, cate, repaiService)
                              .create(newProduct);

                          t.fold(
                            (l) => completer.complete(left(l)),
                            (r) => completer.complete(
                              right(r),
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
        } else {
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
                  .where('name', isEqualTo: cate);
              tmp.map(
                (r) => r.map(
                  (cate) async {
                    (await storeRepository
                            .repairServiceRepo(aUser, cate)
                            .where('name', isEqualTo: sName))
                        .map(
                      (r) => r.map(
                        (repaiService) async {
                          (await storeRepository
                                  .repairProductRepo(aUser, cate, repaiService)
                                  .where('name', isEqualTo: pName))
                              .map(
                            (r) => r.map((product) async {
                              final newProduct = RepairProduct(
                                name: data.productName,
                                desc: data.des,
                                img: data.imageUrl,
                                price: data.productFee,
                                active: data.isActive,
                              );
                              final t = await storeRepository
                                  .repairProductRepo(aUser, cate, repaiService)
                                  .update(newProduct);
                              t.fold(
                                (l) => completer.complete(left(l)),
                                (r) => completer.complete(
                                  right(r),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          );
        }
        (await completer.future).fold(
          (l) => emit(const AddProductState.failure()),
          (r) => emit(
            const AddProductState.addServiceSuccess(),
          ),
        );
      },
    );
  }
}

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revup_core/core.dart';

part 'account_bloc.freezed.dart';
part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc(
    this.providerID,
    this._userRepos,
    this._repairRecord,
    this.storeRepository,
    this._imagePicker,
    this.storageBloc,
  ) : super(const _Initial()) {
    on<AccountEvent>(_onEvent);
    _s = _userRepos
        .collection()
        .where('uuid', isEqualTo: providerID)
        .snapshots()
        .listen((event) async {
      add(AccountEvent.dataChanged(data: event));
    });
  }
  late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>> _s;
  final String providerID;
  final IStore<AppUser> _userRepos;
  final StoreRepository storeRepository;
  final IStore<RepairRecord> _repairRecord;
  final ImagePicker _imagePicker;
  final StorageBloc storageBloc;
  FutureOr<void> _onEvent(
    AccountEvent event,
    Emitter<AccountState> emit,
  ) async {
    await event.when(
      dataChanged: (data) async {
        emit(const AccountState.loading());
        final feedbackData =
            (await _repairRecord.where('pid', isEqualTo: providerID))
                .map(
                  (r) => r.map(
                    (a) => a.maybeMap<Future<Option<ReportFeedback>>>(
                      orElse: () async => none(),
                      finished: (v) async => (v.feedback != null)
                          ? some(
                              v.feedback!,
                            )
                          : none(),
                    ),
                  ),
                )
                .fold<IList<Future<Option<ReportFeedback>>>>(
                  (l) => throw NullThrownError(),
                  (r) => r,
                );

        final feedbacksIterable = (await Future.wait(feedbackData.toIterable()))
            .where((e) => e.isSome())
            .map((e) => e.getOrElse(() => throw NullThrownError()));
        final feedbackTotalRating = feedbacksIterable.fold<int>(
          0,
          (previousValue, element) => previousValue + element.rating,
        );

        final everageRating = feedbackTotalRating / feedbacksIterable.length;

        (await _userRepos.get(providerID))
            .map(
              (r) => r.maybeMap<Option<AppUser>>(
                orElse: none,
                provider: some,
              ),
            )
            .fold<Option<AppUser>>((l) => none(), (r) => r)
            .fold(
          () => emit(const AccountState.failure()),
          (aUser) {
            emit(
              AccountState.success(
                aUser: aUser,
                rating: everageRating,
                newImgUrl: '',
              ),
            );
          },
        );
      },
      started: () async {
        emit(const AccountState.loading());
        final feedbackData =
            (await _repairRecord.where('pid', isEqualTo: providerID))
                .map(
                  (r) => r.map(
                    (a) => a.maybeMap<Future<Option<ReportFeedback>>>(
                      orElse: () async => none(),
                      finished: (v) async => (v.feedback != null)
                          ? some(
                              v.feedback!,
                            )
                          : none(),
                    ),
                  ),
                )
                .fold<IList<Future<Option<ReportFeedback>>>>(
                  (l) => throw NullThrownError(),
                  (r) => r,
                );

        final feedbacksIterable = (await Future.wait(feedbackData.toIterable()))
            .where((e) => e.isSome())
            .map((e) => e.getOrElse(() => throw NullThrownError()));
        final feedbackTotalRating = feedbacksIterable.fold<int>(
          0,
          (previousValue, element) => previousValue + element.rating,
        );

        final everageRating = feedbackTotalRating / feedbacksIterable.length;

        (await _userRepos.get(providerID))
            .map(
              (r) => r.maybeMap<Option<AppUser>>(
                orElse: none,
                provider: some,
              ),
            )
            .fold<Option<AppUser>>((l) => none(), (r) => r)
            .fold(
          () => emit(const AccountState.failure()),
          (aUser) {
            emit(
              AccountState.success(
                aUser: aUser,
                rating: everageRating,
                newImgUrl: '',
              ),
            );
          },
        );
      },
      imageUploadSelected: (source) async {
        final pickedImage = await _imagePicker.pickImage(source: source);
        if (pickedImage != null) {
          final _image = File(pickedImage.path);
          final feedbackData =
              (await _repairRecord.where('pid', isEqualTo: providerID))
                  .map(
                    (r) => r.map(
                      (a) => a.maybeMap<Future<Option<ReportFeedback>>>(
                        orElse: () async => none(),
                        finished: (v) async => (v.feedback != null)
                            ? some(
                                v.feedback!,
                              )
                            : none(),
                      ),
                    ),
                  )
                  .fold<IList<Future<Option<ReportFeedback>>>>(
                    (l) => throw NullThrownError(),
                    (r) => r,
                  );

          final feedbacksIterable =
              (await Future.wait(feedbackData.toIterable()))
                  .where((e) => e.isSome())
                  .map((e) => e.getOrElse(() => throw NullThrownError()));
          final feedbackTotalRating = feedbacksIterable.fold<int>(
            0,
            (previousValue, element) => previousValue + element.rating,
          );

          final everageRating = feedbackTotalRating / feedbacksIterable.length;
          (await _userRepos.get(providerID))
              .map(
                (r) => r.maybeMap<Option<AppUser>>(
                  orElse: none,
                  provider: some,
                ),
              )
              .fold<Option<AppUser>>((l) => none(), (r) => r)
              .fold(
                () => emit(const AccountState.failure()),
                (aUser) async => uploadImg(
                  file: StorageFile.profile(file: _image),
                  emit: emit,
                  rating: everageRating,
                ),
              );
        }
      },
    );
  }

  Future<Unit> uploadImg({
    required StorageFile file,
    required Emitter<AccountState> emit,
    required double rating,
  }) async {
    storageBloc.add(StorageEvent.upload(file: file));
    await _listenWhen(
      (state) async => state.maybeWhen(
        success: (eitherFailuresOrUrls) => eitherFailuresOrUrls.map(
          (a) => a.fold(
            (l) => emit(const AccountState.failure()),
            (newImgUrl) async {
              final tmp = (await _userRepos.get(providerID))
                  .map(
                    (r) => r.maybeMap<Option<AppUser>>(
                      orElse: none,
                      provider: some,
                    ),
                  )
                  .fold<Option<AppUser>>((l) => none(), (r) => r);
              await tmp.fold(
                () => null,
                (a) => a.maybeMap(
                  provider: (value) async {
                    final tmp = AppUser.provider(
                      uuid: value.uuid,
                      firstName: value.firstName,
                      lastName: value.lastName,
                      phone: value.phone,
                      dob: value.dob,
                      addr: value.addr,
                      email: value.email,
                      active: value.active,
                      avatarUrl: newImgUrl,
                      createdTime: value.createdTime,
                      lastUpdatedTime: value.lastUpdatedTime,
                      idCardNum: value.idCardNum,
                      idCardImage: value.idCardImage,
                      backgroundUrl: value.backgroundUrl,
                      bio: value.bio,
                      vac: value.vac,
                      online: value.online,
                      loc: value.loc,
                    );
                    final newProvider =
                        AppUserDummy.dummyProvider(providerID).maybeMap(
                      orElse: () => throw NullThrownError(),
                      provider: (value) => value.copyWith(avatarUrl: newImgUrl),
                    );
                    final t = await _userRepos.updateFields(
                      newProvider,
                      ilist(
                        [
                          AppUserDummy.field(AppUserFields.AvatarUrl),
                        ],
                      ),
                    );
                    t.fold(
                      (l) => emit(
                        const AccountState.loading(),
                      ),
                      (r) => emit(
                        AccountState.success(
                          aUser: tmp,
                          rating: rating,
                          newImgUrl: newImgUrl,
                        ),
                      ),
                    );
                  },
                  orElse: () => throw NullThrownError(),
                ),
              );
            },
          ),
        ),
        orElse: () => false,
      ),
      emit,
    );
    return unit;
  }

  Future<Unit> _listenWhen(
    Function1<StorageState, void> map,
    Emitter<AccountState> emit,
  ) async {
    await emit.onEach<StorageState>(
      storageBloc.stream,
      onData: map,
    );

    return unit;
  }

  @override
  Future<void> close() async {
    await _s.cancel();
    return super.close();
  }
}

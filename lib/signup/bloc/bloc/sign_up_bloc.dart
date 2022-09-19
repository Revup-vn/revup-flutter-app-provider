import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

import '../../../configs/video_call_config.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this.storageBloc) : super(const _Initial()) {
    on<SignUpEvent>(_onEvent);
  }

  final StorageBloc storageBloc;

  FutureOr<void> _onEvent(
    SignUpEvent event,
    Emitter<SignUpState> emit,
  ) async {
    await event.when(
      started: () async {},
      submited: (user, files, completer) async {
        emit(const SignUpState.loading());
        final list = files.map((file) async {
          final cplt = Completer<String>();
          if (file.path.isNotEmpty) {
            await uploadImg(
              file: StorageFile.profile(file: file),
              emit: emit,
              completer: cplt,
            );
          } else {
            cplt.complete('');
          }
          final res = await cplt.future;
          return res;
        });
        final listImg = await Future.wait(list);
        final provider = user.maybeMap(
          orElse: () => throw NullThrownError(),
          provider: (value) => value,
        );
        completer.complete(
          AppUser.provider(
            uuid: user.uuid,
            firstName: user.firstName,
            lastName: user.lastName,
            phone: user.phone,
            dob: user.dob,
            addr: user.addr,
            email: user.email,
            active: user.active,
            avatarUrl: listImg[0],
            createdTime: user.createdTime,
            lastUpdatedTime: user.lastUpdatedTime,
            idCardNum: provider.idCardNum,
            idCardImage: listImg[2],
            backgroundUrl: listImg[1],
            bio: provider.bio,
            vac: provider.vac,
            online: provider.online,
            loc: provider.loc,
          ),
        );
        final cubeUser = CubeUser(
          login: provider.phone,
          password: DEFAULT_PASS,
        );
        await signUp(cubeUser);
        emit(const SignUpState.success());
      },
    );
  }

  Future<Unit> uploadImg({
    required StorageFile file,
    required Emitter<SignUpState> emit,
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
            (l) => emit(
              const SignUpState.initial(),
            ),
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

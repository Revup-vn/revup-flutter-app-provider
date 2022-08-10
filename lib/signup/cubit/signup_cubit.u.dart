import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'signup_cubit_state.dart';
part 'signup_cubit.u.freezed.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit(this._storageBloc) : super(const SignupCubitState.initial());

  final StorageBloc _storageBloc;

  Future<Unit> uploadImg({required IList<StorageFile> files}) async {
    final isDoneLogin = Completer<Unit>();
    _storageBloc.add(StorageEvent.uploadMany(files: files));

    return _listenOnce(
      isDoneLogin,
      (event) async => event.maybeWhen(
        success: (eitherFailuresOrUrls) => emit(
          SignupCubitState.uploadImageSuccess(
            eitherFailuresOrUrls: eitherFailuresOrUrls,
          ),
        ),
        error: (failure) => emit(const SignupCubitState.failure()),
        orElse: () => emit(
          const SignupCubitState.running(),
        ),
      ),
    );
  }

  Future<Unit> _listenOnce(
    Completer<Unit> isDone,
    Function1<StorageState, void> map,
  ) async {
    final _tmp = _storageBloc.stream.listen(
      (event) {
        map(event);
        event.maybeMap(
          success: (value) => isDone.complete(unit),
          orElse: () => unit,
          error: (_) => _storageBloc.add(const StorageEvent.reset()),
        );
      },
    );
    await isDone.future;
    await _tmp.cancel();

    return unit;
  }
}

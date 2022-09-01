import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'common_service_cubit.freezed.dart';
part 'common_service_state.dart';

class CommonServiceCubit extends Cubit<CommonServiceCubitState> {
  CommonServiceCubit(this._storageBloc)
      : super(const CommonServiceCubitState.initial());

  final StorageBloc _storageBloc;

  Future<Unit> uploadImg({required StorageFile file}) async {
    final isDoneLogin = Completer<Unit>();
    _storageBloc.add(StorageEvent.upload(file: file));

    return _listenOnce(
      isDoneLogin,
      (event) async => event.maybeWhen(
        success: (eitherFailuresOrUrls) => emit(
          CommonServiceCubitState.uploadImageSuccess(
            eitherFailuresOrUrls: eitherFailuresOrUrls,
          ),
        ),
        error: (failure) => emit(const CommonServiceCubitState.failure()),
        orElse: () => emit(
          const CommonServiceCubitState.running(),
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
        );
      },
    );
    await isDone.future;
    await _tmp.cancel();

    return unit;
  }
}

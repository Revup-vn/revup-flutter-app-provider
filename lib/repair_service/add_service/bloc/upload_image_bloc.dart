import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revup_core/core.dart';

part 'upload_image_bloc.freezed.dart';
part 'upload_image_event.dart';
part 'upload_image_state.dart';

class UploadImageBloc extends Bloc<UploadImageEvent, UploadImageState> {
  UploadImageBloc(
    this._imagePicker,
    this.storageBloc,
  ) : super(const _Initial()) {
    on<UploadImageEvent>(_onEvent);
  }
  final ImagePicker _imagePicker;
  final StorageBloc storageBloc;
  FutureOr<void> _onEvent(
    UploadImageEvent event,
    Emitter<UploadImageState> emit,
  ) async {
    await event.when(
      started: () {
        emit(const UploadImageState.initial());
      },
      imageUploadSelected: (source) async {
        final pickedImage = await _imagePicker.pickImage(source: source);
        if (pickedImage != null) {
          final _image = File(pickedImage.path);
          await uploadImg(
            file: StorageFile.profile(file: _image),
            emit: emit,
          );
        }
      },
    );
  }

  Future<Unit> uploadImg({
    required StorageFile file,
    required Emitter<UploadImageState> emit,
  }) async {
    storageBloc.add(StorageEvent.upload(file: file));
    await _listenWhen(
      (state) async => state.maybeWhen(
        success: (eitherFailuresOrUrls) => eitherFailuresOrUrls.map(
          (a) => a.fold(
            (l) => emit(const UploadImageState.failure()),
            (newImgUrl) async {
              emit(
                UploadImageState.success(newImgUrl: newImgUrl),
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
    Emitter<UploadImageState> emit,
  ) async {
    await emit.onEach<StorageState>(
      storageBloc.stream,
      onData: map,
    );

    return unit;
  }
}

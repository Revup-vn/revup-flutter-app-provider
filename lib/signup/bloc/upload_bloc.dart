import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_bloc.freezed.dart';
part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc(this._imagePicker) : super(const _Initial()) {
    on<UploadEvent>(_onEvent);
  }
  final ImagePicker _imagePicker;

  FutureOr<void> _onEvent(
    UploadEvent event,
    Emitter<UploadState> emit,
  ) async {
    await event.when(
      started: () {
        emit(const UploadState.initial());
      },
      imageUploadSelected: (source, currentListStorage, typeUpload) async {
        final pickedImage = await _imagePicker.pickImage(source: source);
        final list = List<File>.from(currentListStorage);
        if (pickedImage != null) {
          final _image = File(pickedImage.path);
          list[typeUpload] = _image;
        }
        emit(UploadState.choosePhotoSuccess(file: list));
      },
    );
  }
}

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'upload_image_bloc.freezed.dart';
part 'upload_image_event.dart';
part 'upload_image_state.dart';

class UploadImageBloc extends Bloc<UploadImageEvent, UploadImageState> {
  UploadImageBloc(this._imagePicker) : super(const _Initial()) {
    on<UploadImageEvent>(_onEvent);
  }
  final ImagePicker _imagePicker;
  FutureOr<void> _onEvent(
    UploadImageEvent event,
    Emitter<UploadImageState> emit,
  ) async {
    await event.when(
      started: () {},
      imageUploadSelected: (source, currentListStorage, typeUpload) async {
        final pickedImage = await _imagePicker.pickImage(source: source);
        final list = List<File>.from(currentListStorage);
        if (pickedImage != null) {
          final _image = File(pickedImage.path);
          list[typeUpload] = _image;
        }
        emit(UploadImageState.choosePhotoSuccess(file: list));
      },
    );
  }
}

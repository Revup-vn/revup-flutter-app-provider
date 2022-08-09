import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:revup_core/core.dart';

part 'signup_event.dart';
part 'signup_state.dart';
part 'signup_bloc.freezed.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this._imagePicker) : super(const _Initial()) {
    on<SignupEvent>(_onEvent);
  }
  final ImagePicker _imagePicker;

  FutureOr<void> _onEvent(
    SignupEvent event,
    Emitter<SignupState> emit,
  ) async {
    await event.when(
      started: () {
        emit(const SignupState.initial());
      },
      imageUploadSelected: (source, currentListStorage, typeUpload) async {
        final pickedImage = await _imagePicker.pickImage(source: source);
        final list = List<File>.from(currentListStorage);
        if (pickedImage != null) {
          final _image = File(pickedImage.path);
          list[typeUpload] = _image;
        }
        emit(SignupState.choosePhotoSuccess(file: list));
      },
    );
  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
    this._imagePicker,
  ) : super(const ProductState.initial());
  final ImagePicker _imagePicker;
  Future<void> addImg(ImageSource imgSource) async {
    final pickedImage = await _imagePicker.pickImage(source: imgSource);
    if (pickedImage != null) {
      final _image = File(pickedImage.path);
      emit(ProductState.addImgSuccess(img: _image));
    }
  }
}

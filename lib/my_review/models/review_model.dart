import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/models/models.dart';

part 'review_model.freezed.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required UserModel user,
    required String comment,
    required int rating,
    required DateTime commentedData,
  }) = _ReviewModel;
}

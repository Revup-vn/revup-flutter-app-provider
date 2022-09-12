import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:revup_core/core.dart';

part 'rating_data.freezed.dart';

@freezed
class RatingData with _$RatingData {
  factory RatingData({
    required int rating,
    required String description,
    required DateTime createdTime,
    required DateTime updatedTime,
    required String consumerName,
    required String imageUrl,
  }) = _RatingData;
  factory RatingData.fromDtos(AppUser user, ReportFeedback feedback) =>
      RatingData(
        consumerName: '${user.firstName} ${user.lastName}',
        createdTime: feedback.created,
        description: feedback.desc.isEmpty ? '' : feedback.desc,
        imageUrl: user.avatarUrl,
        updatedTime: feedback.updated,
        rating: feedback.rating,
      );
}

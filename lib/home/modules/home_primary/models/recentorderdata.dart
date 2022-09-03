import 'package:freezed_annotation/freezed_annotation.dart';

part 'recentorderdata.freezed.dart';

@freezed
class RecentOrderData with _$RecentOrderData {
  factory RecentOrderData({
    required String providerName,
    required String imageUrl,
    required int serviceType,
    required DateTime created,
    required int rating,
  }) = _RecentOrderData;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'myservicedata.freezed.dart';

@freezed
class MyServiceData with _$MyServiceData {
  factory MyServiceData({
    required String name,
    required String imgUrl,
    required int fee,
    required bool isActive,
  }) = _MyServiceData;
}

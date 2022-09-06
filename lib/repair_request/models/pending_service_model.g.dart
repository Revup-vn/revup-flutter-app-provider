// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PendingServiceModel _$$_PendingServiceModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_PendingServiceModel',
      json,
      ($checkedConvert) {
        final val = _$_PendingServiceModel(
          name: $checkedConvert('name', (v) => v as String),
          imageUrl: $checkedConvert('image_url', (v) => v as String?),
          price: $checkedConvert('price', (v) => v as int),
          isOptional: $checkedConvert('is_optional', (v) => v as bool),
          products: $checkedConvert(
              'products',
              (v) => (v as List<dynamic>)
                  .map(
                      (e) => PaymentProduct.fromJson(e as Map<String, dynamic>))
                  .toList()),
          status: $checkedConvert('status', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'imageUrl': 'image_url', 'isOptional': 'is_optional'},
    );

Map<String, dynamic> _$$_PendingServiceModelToJson(
        _$_PendingServiceModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image_url': instance.imageUrl,
      'price': instance.price,
      'is_optional': instance.isOptional,
      'products': instance.products.map((e) => e.toJson()).toList(),
      'status': instance.status,
    };

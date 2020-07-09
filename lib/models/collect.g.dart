// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collect _$CollectFromJson(Map<String, dynamic> json) {
  return Collect(
    json['id'] as int,
    json['goods_id'] as int,
    json['goods'] == null
        ? null
        : Product.fromJson(json['goods'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectToJson(Collect instance) => <String, dynamic>{
      'id': instance.id,
      'goods_id': instance.goodsId,
      'goods': instance.goods,
    };

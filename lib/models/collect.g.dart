// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collect _$CollectFromJson(Map<String, dynamic> json) {
  return Collect(
    json['id'] as int,
    json['goods_id'] as int,
    Product.fromJson(json['goods'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectToJson(Collect instance) => <String, dynamic>{
      'id': instance.id,
      'goods_id': instance.goodsId,
      'goods': instance.goods,
    };

CollectPage _$CollectPageFromJson(Map<String, dynamic> json) {
  return CollectPage(
    (json['data'] as List<dynamic>)
        .map((e) => Collect.fromJson(e as Map<String, dynamic>))
        .toList(),
    Paging.fromJson(json['paging'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectPageToJson(CollectPage instance) =>
    <String, dynamic>{
      'paging': instance.paging,
      'data': instance.data,
    };

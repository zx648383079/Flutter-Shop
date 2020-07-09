// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Site _$SiteFromJson(Map<String, dynamic> json) {
  return Site(
    json['name'] as String,
    json['version'] as String,
    json['logo'] as String,
    json['goods'] as int,
    json['category'] as int,
    json['brand'] as int,
    json['currency'] as String,
  );
}

Map<String, dynamic> _$SiteToJson(Site instance) => <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'logo': instance.logo,
      'goods': instance.goods,
      'category': instance.category,
      'brand': instance.brand,
      'currency': instance.currency,
    };

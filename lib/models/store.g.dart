// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) {
  return Store(
    json['id'] as int,
    json['name'] as String,
    json['logo'] as String,
    json['collect_count'] as int,
    json['is_collected'] as bool,
  );
}

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'collect_count': instance.collectCount,
      'is_collected': instance.isCollected,
    };

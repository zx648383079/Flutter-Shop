// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['id'] as int,
    json['name'] as String,
    json['icon'] as String,
    json['app_banner'] as String,
    json['parent_id'] as int,
  )
    ..banner = json['banner'] as String
    ..expanded = json['expanded'] as bool
    ..level = json['level'] as int;
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'banner': instance.banner,
      'app_banner': instance.appBanner,
      'parent_id': instance.parentId,
      'expanded': instance.expanded,
      'level': instance.level,
    };

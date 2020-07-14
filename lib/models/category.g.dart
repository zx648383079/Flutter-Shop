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
  )..banner = json['banner'] as String;
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'banner': instance.banner,
      'app_banner': instance.appBanner,
      'parent_id': instance.parentId,
    };

CategoryExtra _$CategoryExtraFromJson(Map<String, dynamic> json) {
  return CategoryExtra(
    json['id'] as int,
    json['name'] as String,
    json['icon'] as String,
    json['app_banner'] as String,
    json['parent_id'] as int,
  )
    ..banner = json['banner'] as String
    ..expanded = json['expanded'] as bool
    ..level = json['level'] as int
    ..children = (json['children'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..goodsList = (json['goods_list'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CategoryExtraToJson(CategoryExtra instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'banner': instance.banner,
      'app_banner': instance.appBanner,
      'parent_id': instance.parentId,
      'expanded': instance.expanded,
      'level': instance.level,
      'children': instance.children,
      'goods_list': instance.goodsList,
    };

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return CategoryData(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

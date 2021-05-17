// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserItem _$UserItemFromJson(Map<String, dynamic> json) {
  return UserItem(
    json['id'] as int,
    json['name'] as String,
    json['avatar'] as String,
    icon: json['icon'] as String?,
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$UserItemToJson(UserItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'avatar': instance.avatar,
      'count': instance.count,
    };

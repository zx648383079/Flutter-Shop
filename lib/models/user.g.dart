// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['name'] as String,
    json['email'] as String,
    json['sex'] as int,
    json['avatar'] as String,
    json['token'] as String?,
    json['status'] as int,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['money'] as int,
  )
    ..sexLabel = json['sex_label'] as String?
    ..birthday = json['birthday'] as String?
    ..isAdmin = json['is_admin'] as bool?;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'sex': instance.sex,
      'sex_label': instance.sexLabel,
      'avatar': instance.avatar,
      'birthday': instance.birthday,
      'token': instance.token,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'money': instance.money,
      'is_admin': instance.isAdmin,
    };

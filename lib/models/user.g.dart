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
    json['token'] as String,
    json['status'] as int,
    json['createdAt'] as String,
    json['updatedAt'] as String,
    json['money'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'sex': instance.sex,
      'avatar': instance.avatar,
      'token': instance.token,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'money': instance.money,
    };

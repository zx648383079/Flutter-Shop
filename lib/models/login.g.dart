// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    json['email'] as String,
    json['password'] as String,
  )
    ..mobile = json['mobile'] as String
    ..code = json['code'] as String;
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'mobile': instance.mobile,
      'code': instance.code,
    };

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return Register(
    json['name'] as String,
    json['email'] as String,
    json['password'] as String,
    json['confirm_password'] as String,
    json['agree'] as bool,
  )
    ..mobile = json['mobile'] as String
    ..code = json['code'] as String;
}

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'mobile': instance.mobile,
      'code': instance.code,
      'confirm_password': instance.confirmPassword,
      'agree': instance.agree,
    };

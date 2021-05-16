// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    json['email'] as String,
    json['password'] as String,
  )..remember = json['remember'] as bool;
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'remember': instance.remember,
    };

Register _$RegisterFromJson(Map<String, dynamic> json) {
  return Register(
    json['name'] as String,
    json['email'] as String,
    json['password'] as String,
    json['confirm_password'] as String,
    json['agree'] as bool,
  );
}

Map<String, dynamic> _$RegisterToJson(Register instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
      'agree': instance.agree,
    };

ResetForm _$ResetFormFromJson(Map<String, dynamic> json) {
  return ResetForm(
    json['email'] as String,
    json['code'] as String,
    json['password'] as String,
    json['confirm_password'] as String,
  );
}

Map<String, dynamic> _$ResetFormToJson(ResetForm instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'code': instance.code,
      'confirm_password': instance.confirmPassword,
    };

PasswordForm _$PasswordFormFromJson(Map<String, dynamic> json) {
  return PasswordForm(
    json['old_password'] as String,
    json['password'] as String,
    json['confirm_password'] as String,
  );
}

Map<String, dynamic> _$PasswordFormToJson(PasswordForm instance) =>
    <String, dynamic>{
      'password': instance.password,
      'confirm_password': instance.confirmPassword,
      'old_password': instance.oldPassword,
    };

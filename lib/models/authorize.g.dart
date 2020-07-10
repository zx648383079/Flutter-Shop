// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrAction _$QrActionFromJson(Map<String, dynamic> json) {
  return QrAction()
    ..token = json['token'] as String
    ..confirm = json['confirm'] as bool
    ..reject = json['reject'] as bool;
}

Map<String, dynamic> _$QrActionToJson(QrAction instance) => <String, dynamic>{
      'token': instance.token,
      'confirm': instance.confirm,
      'reject': instance.reject,
    };

QrToken _$QrTokenFromJson(Map<String, dynamic> json) {
  return QrToken()
    ..id = json['id'] as int
    ..status = json['status'] as int
    ..createdAt = json['created_at'] as String;
}

Map<String, dynamic> _$QrTokenToJson(QrToken instance) => <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'created_at': instance.createdAt,
    };

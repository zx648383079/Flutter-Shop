// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Connect _$ConnectFromJson(Map<String, dynamic> json) {
  return Connect(
    json['id'] as int,
    json['name'] as String,
    json['icon'] as String,
    json['vendor'] as String,
    json['nickname'] as String,
    json['created_at'] as String,
  );
}

Map<String, dynamic> _$ConnectToJson(Connect instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'vendor': instance.vendor,
      'nickname': instance.nickname,
      'created_at': instance.createdAt,
    };

ConnectData _$ConnectDataFromJson(Map<String, dynamic> json) {
  return ConnectData(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Connect.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConnectDataToJson(ConnectData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

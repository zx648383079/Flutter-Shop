// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckIn _$CheckInFromJson(Map<String, dynamic> json) {
  return CheckIn(
    json['id'] as int,
    json['running'] as int,
    json['created_at'] as String,
    json['type'] as int,
  );
}

Map<String, dynamic> _$CheckInToJson(CheckIn instance) => <String, dynamic>{
      'id': instance.id,
      'running': instance.running,
      'created_at': instance.createdAt,
      'type': instance.type,
    };

CheckInData _$CheckInDataFromJson(Map<String, dynamic> json) {
  return CheckInData(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : CheckIn.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CheckInDataToJson(CheckInData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CheckInOne _$CheckInOneFromJson(Map<String, dynamic> json) {
  return CheckInOne(
    json['data'] == null
        ? null
        : CheckIn.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CheckInOneToJson(CheckInOne instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

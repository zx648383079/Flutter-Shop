// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ad _$AdFromJson(Map<String, dynamic> json) {
  return Ad(
    json['id'] as int,
    json['name'] as String,
    json['type'] as int,
    json['url'] as String,
    json['content'] as String,
  );
}

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'url': instance.url,
      'content': instance.content,
    };

AdData _$AdDataFromJson(Map<String, dynamic> json) {
  return AdData(
    (json['data'] as List<dynamic>)
        .map((e) => Ad.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AdDataToJson(AdData instance) => <String, dynamic>{
      'data': instance.data,
    };

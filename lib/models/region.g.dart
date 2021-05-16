// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
    json['id'] as int,
    json['name'] as String,
    json['parent_id'] as int,
    json['full_name'] as String,
  );
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parent_id': instance.parentId,
      'full_name': instance.fullName,
    };

RegionData _$RegionDataFromJson(Map<String, dynamic> json) {
  return RegionData(
    (json['data'] as List<dynamic>)
        .map((e) => Region.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RegionDataToJson(RegionData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['id'] as int,
    json['name'] as String,
    json['tel'] as String,
    json['region_id'] as int,
    json['address'] as String,
    json['is_default'] as bool,
  )
    ..regionName = json['region_name'] as String
    ..region = json['region'] == null
        ? null
        : Region.fromJson(json['region'] as Map<String, dynamic>);
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tel': instance.tel,
      'region_id': instance.regionId,
      'region_name': instance.regionName,
      'address': instance.address,
      'is_default': instance.isDefault,
      'region': instance.region,
    };

AddressData _$AddressDataFromJson(Map<String, dynamic> json) {
  return AddressData(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

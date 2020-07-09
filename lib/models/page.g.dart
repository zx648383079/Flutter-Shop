// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paging _$PagingFromJson(Map<String, dynamic> json) {
  return Paging(
    json['limit'] as int,
    json['offset'] as int,
    json['total'] as int,
    json['more'] as bool,
  );
}

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'total': instance.total,
      'more': instance.more,
    };

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return BaseResponse(
    json['appid'] as String,
    json['sign'] as String,
    json['sign_type'] as String,
    json['timestamp'] as String,
    json['encrypt'] as String,
    json['encrypt_type'] as String,
  );
}

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'appid': instance.appid,
      'sign': instance.sign,
      'sign_type': instance.signType,
      'timestamp': instance.timestamp,
      'encrypt': instance.encrypt,
      'encrypt_type': instance.encryptType,
    };

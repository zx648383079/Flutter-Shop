// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountLog _$AccountLogFromJson(Map<String, dynamic> json) {
  return AccountLog(
    json['id'] as int,
    (json['money'] as num)?.toDouble(),
  )
    ..type = json['type'] as int
    ..itemId = json['item_id'] as int
    ..status = json['status'] as int
    ..remark = json['remark'] as String
    ..createdAt = json['created_at'] as String;
}

Map<String, dynamic> _$AccountLogToJson(AccountLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'item_id': instance.itemId,
      'money': instance.money,
      'status': instance.status,
      'remark': instance.remark,
      'created_at': instance.createdAt,
    };

Card _$CardFromJson(Map<String, dynamic> json) {
  return Card(
    json['id'] as int,
    json['type'] as int,
  )
    ..icon = json['icon'] as String
    ..bank = json['bank'] as String
    ..cardNo = json['card_no'] as String
    ..status = json['status'] as int
    ..createdAt = json['created_at'] as String;
}

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'icon': instance.icon,
      'bank': instance.bank,
      'card_no': instance.cardNo,
      'status': instance.status,
      'created_at': instance.createdAt,
    };

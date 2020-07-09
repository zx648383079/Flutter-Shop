// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legwork.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegworkForm _$LegworkFormFromJson(Map<String, dynamic> json) {
  return LegworkForm(
    json['name'] as String,
    json['label'] as String,
  )
    ..required = json['required'] as bool
    ..only = json['only'] as bool
    ..value = json['value'] as String;
}

Map<String, dynamic> _$LegworkFormToJson(LegworkForm instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'required': instance.required,
      'only': instance.only,
      'value': instance.value,
    };

LegworkService _$LegworkServiceFromJson(Map<String, dynamic> json) {
  return LegworkService(
    json['id'] as int,
    json['name'] as String,
    json['thumb'] as String,
    json['brief'] as String,
    json['content'] as String,
    (json['price'] as num)?.toDouble(),
  )..form = (json['form'] as List)
      ?.map((e) =>
          e == null ? null : LegworkForm.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$LegworkServiceToJson(LegworkService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumb': instance.thumb,
      'brief': instance.brief,
      'content': instance.content,
      'price': instance.price,
      'form': instance.form,
    };

LegworkOrder _$LegworkOrderFromJson(Map<String, dynamic> json) {
  return LegworkOrder()
    ..id = json['id'] as int
    ..userId = json['user_id'] as int
    ..serviceId = json['service_id'] as int
    ..remark = (json['remark'] as List)
        ?.map((e) =>
            e == null ? null : LegworkForm.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..orderAmount = (json['order_amount'] as num)?.toDouble()
    ..runner = json['runner'] as int
    ..status = json['status'] as int
    ..serviceRank = json['service_rank'] as int
    ..payAt = json['pay_at'] as String
    ..takingAt = json['taking_at'] as String
    ..takenAt = json['taken_at'] as String
    ..finishAt = json['finish_at'] as String
    ..createdAt = json['created_at'] as String
    ..updatedAt = json['updated_at'] as String;
}

Map<String, dynamic> _$LegworkOrderToJson(LegworkOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'service_id': instance.serviceId,
      'remark': instance.remark,
      'order_amount': instance.orderAmount,
      'runner': instance.runner,
      'status': instance.status,
      'service_rank': instance.serviceRank,
      'pay_at': instance.payAt,
      'taking_at': instance.takingAt,
      'taken_at': instance.takenAt,
      'finish_at': instance.finishAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

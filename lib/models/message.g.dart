// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageBase _$MessageBaseFromJson(Map<String, dynamic> json) {
  return MessageBase(
    json['id'] as int,
    _$enumDecode(_$MessageTypeEnumMap, json['type']),
    json['content'] as String,
    json['created_at'] as String,
    extraRule: (json['extra_rule'] as List<dynamic>?)
        ?.map((e) => ExtraRule.fromJson(e as Map<String, dynamic>))
        .toList(),
    user: json['user'] == null
        ? null
        : UserItem.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MessageBaseToJson(MessageBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'type': _$MessageTypeEnumMap[instance.type],
      'content': instance.content,
      'extra_rule': instance.extraRule,
      'created_at': instance.createdAt,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$MessageTypeEnumMap = {
  MessageType.TEXT: 'TEXT',
  MessageType.IMAGE: 'IMAGE',
  MessageType.VIDEO: 'VIDEO',
  MessageType.VOICE: 'VOICE',
  MessageType.FILE: 'FILE',
};

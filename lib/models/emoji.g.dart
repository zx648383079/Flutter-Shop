// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emoji _$EmojiFromJson(Map<String, dynamic> json) {
  return Emoji(
    json['id'] as int,
    json['name'] as String,
    json['type'] as int,
    json['content'] as String,
  );
}

Map<String, dynamic> _$EmojiToJson(Emoji instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'content': instance.content,
    };

EmojiCategory _$EmojiCategoryFromJson(Map<String, dynamic> json) {
  return EmojiCategory(
    json['id'] as int,
    json['name'] as String,
    (json['items'] as List<dynamic>)
        .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EmojiCategoryToJson(EmojiCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items,
    };

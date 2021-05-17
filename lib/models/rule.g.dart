// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraRule _$ExtraRuleFromJson(Map<String, dynamic> json) {
  return ExtraRule(
    json['s'] as String,
    u: json['u'] as int?,
    i: json['i'] as String?,
    l: json['l'] as String?,
    f: json['f'] as String?,
    type: json['type'] as int?,
  );
}

Map<String, dynamic> _$ExtraRuleToJson(ExtraRule instance) => <String, dynamic>{
      's': instance.s,
      'u': instance.u,
      'i': instance.i,
      'l': instance.l,
      'f': instance.f,
      'type': instance.type,
    };

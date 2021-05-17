// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulletin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bulletin _$BulletinFromJson(Map<String, dynamic> json) {
  return Bulletin(
    json['id'] as int,
    json['title'] as String,
    json['content'] as String,
    json['type'] as int,
    json['created_at'] as String,
    json['user_name'] as String,
    json['icon'] as String,
  )
    ..extraRule = (json['extra_rule'] as List<dynamic>?)
        ?.map((e) => ExtraRule.fromJson(e as Map<String, dynamic>))
        .toList()
    ..user = json['user'] == null
        ? null
        : UserItem.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BulletinToJson(Bulletin instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'created_at': instance.createdAt,
      'user_name': instance.userName,
      'icon': instance.icon,
      'extra_rule': instance.extraRule,
      'user': instance.user,
    };

BulletinUser _$BulletinUserFromJson(Map<String, dynamic> json) {
  return BulletinUser(
    json['id'] as int,
    json['bulletinId'] as int,
    json['status'] as int,
    json['createdAt'] as String,
    Bulletin.fromJson(json['bulletin'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BulletinUserToJson(BulletinUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bulletinId': instance.bulletinId,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'bulletin': instance.bulletin,
    };

BulletinUserPage _$BulletinUserPageFromJson(Map<String, dynamic> json) {
  return BulletinUserPage(
    (json['data'] as List<dynamic>)
        .map((e) => BulletinUser.fromJson(e as Map<String, dynamic>))
        .toList(),
    Paging.fromJson(json['paging'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BulletinUserPageToJson(BulletinUserPage instance) =>
    <String, dynamic>{
      'paging': instance.paging,
      'data': instance.data,
    };

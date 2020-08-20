import 'package:json_annotation/json_annotation.dart';

import 'page.dart';

part 'bulletin.g.dart';

@JsonSerializable()
class Bulletin extends Object {
  int id;
  String title;
  String content;
  int type;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'user_name')
  String userName;
  String icon;

  Bulletin(this.id, this.title, this.content, this.type, this.createdAt,
      this.userName, this.icon);

  factory Bulletin.fromJson(Map<String, dynamic> json) =>
      _$BulletinFromJson(json);

  Map<String, dynamic> toJson() => _$BulletinToJson(this);
}

@JsonSerializable()
class BulletinUser extends Object {
  int id;
  int bulletinId;
  int status;
  String createdAt;
  Bulletin bulletin;

  BulletinUser(
      this.id, this.bulletinId, this.status, this.createdAt, this.bulletin);

  factory BulletinUser.fromJson(Map<String, dynamic> json) =>
      _$BulletinUserFromJson(json);

  Map<String, dynamic> toJson() => _$BulletinUserToJson(this);
}

@JsonSerializable()
class BulletinUserPage extends Object {
  Paging paging;
  List<BulletinUser> data;

  BulletinUserPage(this.data, this.paging);

  factory BulletinUserPage.fromJson(Map<String, dynamic> json) =>
      _$BulletinUserPageFromJson(json);

  Map<String, dynamic> toJson() => _$BulletinUserPageToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'user_item.g.dart';

@JsonSerializable()
class UserItem extends Object {
  int id;
  String name;
  String? icon;
  String avatar;
  int count;

  UserItem(this.id, this.name, this.avatar, {this.icon, this.count = 0});

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      _$UserItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserItemToJson(this);
}

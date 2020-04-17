import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  int sex;
  String avatar;
  String token;
  int status;
  String createdAt;
  String updatedAt;
  int money;

  User(this.id,
      this.name,
      this.email,
      this.sex,
      this.avatar,
      this.token,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.money);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

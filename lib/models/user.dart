import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object {
  int id;
  String name;
  String email;
  int sex;
  @JsonKey(name: 'sex_label')
  String? sexLabel;
  String avatar;
  String? birthday;
  String? token;
  int status;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  int money;
  @JsonKey(name: 'is_admin')
  bool? isAdmin;

  User(this.id, this.name, this.email, this.sex, this.avatar, this.token,
      this.status, this.createdAt, this.updatedAt, this.money);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

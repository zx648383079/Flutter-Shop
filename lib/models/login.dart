import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class Login extends Object {
  String email;
  String password;
  String mobile;
  String code;

  Login(this.email, this.password);

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable()
class Register extends Object {
  String name;
  String email;
  String password;
  String mobile;
  String code;
  @JsonKey(name: 'confirm_password')
  String confirmPassword;
  bool agree;

  Register(
      this.name, this.email, this.password, this.confirmPassword, this.agree);

  factory Register.fromJson(Map<String, dynamic> json) =>
      _$RegisterFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterToJson(this);
}

@JsonSerializable()
class ResetForm extends Object {
  String email;
  String password;
  // String mobile;
  String code;
  @JsonKey(name: 'confirm_password')
  String confirmPassword;

  ResetForm(this.email, this.code, this.password, this.confirmPassword);

  factory ResetForm.fromJson(Map<String, dynamic> json) =>
      _$ResetFormFromJson(json);

  Map<String, dynamic> toJson() => _$ResetFormToJson(this);
}

@JsonSerializable()
class PasswordForm extends Object {
  String password;
  @JsonKey(name: 'confirm_password')
  String confirmPassword;
  @JsonKey(name: 'old_password')
  String oldPassword;

  PasswordForm(this.oldPassword, this.password, this.confirmPassword);

  factory PasswordForm.fromJson(Map<String, dynamic> json) =>
      _$PasswordFormFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordFormToJson(this);
}

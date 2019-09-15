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

  User(
      {this.id,
      this.name,
      this.email,
      this.sex,
      this.avatar,
      this.token,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.money});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    sex = json['sex'];
    avatar = json['avatar'];
    token = json['token'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    money = json['money'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['sex'] = this.sex;
    data['avatar'] = this.avatar;
    data['token'] = this.token;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['money'] = this.money;
    return data;
  }
}

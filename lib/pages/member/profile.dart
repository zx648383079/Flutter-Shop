import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shop/api/user.dart';
import 'package:flutter_shop/models/user.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:flutter_shop/pages/member/action_sheet.dart';
import 'package:image_picker/image_picker.dart';

import '../../iconfont.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() {
    Application.getUser().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  void tapAvatar() {
    showActionSheet(context, items: ['拍照', '图库选择']).then((value) async {
      if (value < 0) {
        return;
      }
      var img = await ImagePicker().getImage(
          source: value > 0 ? ImageSource.gallery : ImageSource.camera);
      if (img == null) {
        return;
      }
      UserApi.updateAvatar(File(img.path), (res) {
        Application.setUser(res);
        setState(() {
          user = res;
        });
      });
    });
  }

  void updateProfile(String name, dynamic value) {
    UserApi.update({name: value}, (res) {
      Application.setUser(res);
      setState(() {
        user = res;
      });
    });
  }

  void tapSex() {
    showActionSheet(context, items: ['未知', '男', '女']).then((value) async {
      if (value < 0) {
        return;
      }
      updateProfile('sex', value);
    });
  }

  void tapBirthday() {
    var now = DateTime.now();
    showDatePicker(
            context: context,
            initialDate: DateTime.parse(user.birthday),
            firstDate: DateTime(now.year - 100),
            lastDate: now)
        .then((value) {
      if (value == null) {
        return;
      }
      updateProfile('birthday',
          "${value.year.toString()}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('个人信息'),
      ),
      body: showBody(context),
    );
  }

  Widget showBody(BuildContext context) {
    if (user == null) {
      return Container();
    }
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: InkWell(
            onTap: tapAvatar,
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text('头像'),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.network(
                      user.avatar,
                      height: 70,
                      width: 70,
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  child: Icon(IconFont.chevronRight),
                ),
              ],
            ),
          ),
        ),
        hr(),
        profileItem('昵称', user.name, onTap: () {
          Navigator.pushNamed(context, '/member/edit', arguments: {
            'field': 'name',
          }).then((value) {
            loadUser();
          });
        }),
        hr(),
        profileItem('邮箱', user.email),
        hr(),
        profileItem('性别', user.sexLabel, onTap: tapSex),
        hr(),
        profileItem('生日', user.birthday, onTap: tapBirthday),
        SizedBox(
          height: 30,
        ),
        menuItem('我的收货地址', onTap: () {
          Navigator.pushNamed(context, '/address');
        }),
        hr(),
        menuItem('修改密码', onTap: () {
          Navigator.pushNamed(context, '/member/password');
        }),
        hr(),
        menuItem('登录设备管理', onTap: () {
          Navigator.pushNamed(context, '/account/driver');
        }),
        hr(),
        menuItem('账户注销', onTap: () {
          Navigator.pushNamed(context, '/account/cancel');
        }),
        Padding(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            color: Theme.of(context).indicatorColor,
            textColor: Colors.white,
            onPressed: () {
              UserApi.logout((res) {
                Application.removeToken();
                Navigator.pop(context, true);
              });
            },
            child: Text('退出'),
          ),
        ),
      ],
    );
  }

  Widget hr() {
    return Divider(
      height: 1,
      indent: 10,
      endIndent: 10,
    );
  }

  Widget menuItem(String name, {Function onTap}) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(name),
                ),
              ),
              Container(
                width: 40,
                child: Icon(IconFont.chevronRight),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileItem(String name, String value, {Function onTap}) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                child: Text(name),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(value),
                ),
              ),
              Container(
                width: 40,
                child: Icon(IconFont.chevronRight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

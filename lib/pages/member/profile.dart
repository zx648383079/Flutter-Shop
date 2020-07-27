import 'package:flutter/material.dart';
import 'package:flutter_shop/models/user.dart';
import 'package:flutter_shop/pages/application.dart';

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
    Application.getUser().then((value) {
      setState(() {
        user = value;
      });
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
            child: Row(
              children: <Widget>[
                Container(
                  width: 60,
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
                  width: 50,
                  child: Icon(IconFont.chevronRight),
                ),
              ],
            ),
          ),
        ),
        hr(),
        profileItem('昵称', user.name),
        hr(),
        profileItem('邮箱', user.email),
        hr(),
        profileItem('性别', user.sex.toString()),
        hr(),
        profileItem('生日', ''),
        SizedBox(
          height: 30,
        ),
        menuItem('我的收货地址'),
        hr(),
        menuItem('修改密码'),
        hr(),
        menuItem('登录设备管理'),
        hr(),
        menuItem('账户注销', onTap: () {
          Navigator.pushNamed(context, '/account/cancel');
        }),
        Padding(
          padding: EdgeInsets.all(10),
          child: RaisedButton(
            color: Theme.of(context).indicatorColor,
            textColor: Colors.white,
            onPressed: () {},
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
                width: 50,
                child: Icon(IconFont.chevronRight),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileItem(String name, String value) {
    return Container(
      color: Colors.white,
      child: InkWell(
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
                width: 50,
                child: Icon(IconFont.chevronRight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

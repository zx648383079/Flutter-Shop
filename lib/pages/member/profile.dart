import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/index.dart';

import '../../iconfont.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 60,
                child: Text('头像'),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.network(
                    getAssetUrl('assets/images/zx.jpg'),
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
          profileItem('昵称', ''),
          profileItem('邮箱', ''),
          profileItem('性别', ''),
          profileItem('生日', ''),
          SizedBox(
            height: 30,
          ),
          menuItem('我的收货地址'),
          menuItem('修改密码'),
          menuItem('登录设备管理'),
          menuItem('账户注销'),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('退出'),
          ),
        ],
      ),
    );
  }

  Widget menuItem(String name) {
    return Row(
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
    );
  }

  Widget profileItem(String name, String value) {
    return Row(
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
    );
  }
}

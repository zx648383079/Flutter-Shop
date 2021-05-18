import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:flutter_shop/pages/member/email_find.dart';
import 'package:flutter_shop/pages/member/email_login.dart';
import 'package:flutter_shop/pages/member/email_register.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final List oauthItems = [
    {
      'name': 'QQ',
      'icon': IconFont.qq,
    },
    {
      'name': '微信',
      'icon': IconFont.wechat,
    },
    {
      'name': '支付宝',
      'icon': IconFont.alipay,
    },
    {
      'name': 'Github',
      'icon': IconFont.github,
    },
  ];

  int mode = 0;
  String logo = '';
  String get title {
    if (mode == 2) {
      return '注册';
    }
    if (mode == 3) {
      return '找回密码';
    }
    return '登录';
  }

  @override
  void initState() {
    super.initState();
    Application.getSite((site) {
      setState(() {
        logo = site.logo;
      });
    });
  }

  void tapChange(int i) {
    setState(() {
      this.mode = i;
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
        title: Text(title),
        centerTitle: true,
      ),
      body: showLogin(),
    );
  }

  Widget showLogin() {
    if (mode == 1) {
      return EmailloginPage(
        tapFlip: tapChange,
        logo: this.logo,
      );
    }
    if (mode == 2) {
      return EmailRegisterPage(
        tapFlip: tapChange,
      );
    }
    if (mode == 3) {
      return EmailFindPage(
        tapFlip: tapChange,
        logo: this.logo,
      );
    }
    return ListView(
      children: <Widget>[
        Center(
          child: logo.isEmpty ? null : CachedNetworkImage(imageUrl: logo),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).indicatorColor),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              tapChange(1);
            },
            child: Text(
              '邮箱登录',
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            tapChange(2);
          },
          child: Text('邮箱注册'),
        ),
        SizedBox(
          height: 100,
        ),
        buildOtherLoginText(),
        buildOtherMethod(context),
      ],
    );
  }

  ButtonBar buildOtherMethod(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: oauthItems
          .map(
            (item) => Builder(
              builder: (context) {
                return IconButton(
                    icon: Icon(item['icon'],
                        color: Theme.of(context).iconTheme.color),
                    onPressed: () {
                      // todo : 第三方登录方法
                      ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                        content: new Text("${item['name']}登录"),
                        action: new SnackBarAction(
                          label: "取消",
                          onPressed: () {},
                        ),
                      ));
                    });
              },
            ),
          )
          .toList(),
    );
  }

  Align buildOtherLoginText() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        '其他账号登录',
        style: TextStyle(color: Colors.grey, fontSize: 14.0),
      ),
    );
  }
}

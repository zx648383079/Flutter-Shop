import 'package:flutter/material.dart';
import 'package:flutter_shop/api/authorize.dart';
import 'package:flutter_shop/models/authorize.dart';
import 'package:flutter_shop/models/user.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:flutter_shop/utils/index.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../iconfont.dart';

class AuthorizePage extends StatefulWidget {
  final Map arguments;
  AuthorizePage({Key? key, required this.arguments}) : super(key: key);

  @override
  _AuthorizePageState createState() => _AuthorizePageState();
}

class _AuthorizePageState extends State<AuthorizePage> {
  User? user;
  QrAction qr = QrAction();

  @override
  void initState() {
    super.initState();
    Application.getUser().then((value) {
      user = value;
    });
    qr.token = widget.arguments['token'];
    AuthorizeApi.authorizeQrToken(qr, (res) {}, (code, message) {
      Fluttertoast.showToast(
        msg: message ?? '',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(''),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                Center(
                  child: ClipOval(
                    child: Image.network(
                      user?.avatar ?? getAssetUrl('assets/images/zx.jpg'),
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
                Center(
                  child: Text('正在授权WEB端登录'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              qr.confirm = true;
              AuthorizeApi.authorizeQrToken(qr, (res) {
                Navigator.pop(context);
              }, (code, message) {
                Fluttertoast.showToast(
                  msg: message ?? '',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              });
            },
            child: Text('确认授权'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              qr.reject = true;
              AuthorizeApi.authorizeQrToken(qr, (res) {
                Navigator.pop(context);
              }, (code, message) {
                Fluttertoast.showToast(
                  msg: message ?? '',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              });
            },
            child: Text('取消授权'),
          ),
        ],
      ),
    );
  }
}

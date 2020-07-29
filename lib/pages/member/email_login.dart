import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/user.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/login.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmailloginPage extends StatefulWidget {
  final Function(int mode) tapFlip;
  final String logo;
  EmailloginPage({
    Key key,
    this.tapFlip,
    this.logo,
  }) : super(key: key);

  @override
  _EmailloginPageState createState() => _EmailloginPageState();
}

class _EmailloginPageState extends State<EmailloginPage> {
  final formKey = GlobalKey<FormState>();
  String email, password;
  bool isObscure = true;

  void tapLogin() {
    UserApi.login(Login(email, password), (user) {
      Application.setUser(user);
      Navigator.pop(context, true);
    }, (code, err) {
      print(err);
      Fluttertoast.showToast(
        msg: err,
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
    return Container(
      child: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: <Widget>[
            Center(
              child: CachedNetworkImage(imageUrl: widget.logo),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '请输入账号',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入账号';
                }
                return null;
              },
              onSaved: (newValue) => email = newValue,
            ),
            TextFormField(
              obscureText: isObscure,
              decoration: InputDecoration(
                labelText: '请输入密码',
                suffixIcon: IconButton(
                  icon: Icon(isObscure ? IconFont.eye : IconFont.eyeSlash),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入密码';
                }
                return null;
              },
              onSaved: (newValue) => password = newValue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  child: Text('注册账户'),
                  onPressed: () {
                    widget.tapFlip(2);
                  },
                ),
                FlatButton(
                  child: Text('忘记密码'),
                  onPressed: () {
                    widget.tapFlip(3);
                  },
                ),
              ],
            ),
            RaisedButton(
              color: Theme.of(context).indicatorColor,
              textColor: Colors.white,
              child: Text('登录'),
              onPressed: () {
                if (!formKey.currentState.validate()) {
                  return;
                }
                formKey.currentState.save();
                // todo
                tapLogin();
              },
            ),
            RaisedButton(
              color: Colors.white,
              textColor: Theme.of(context).indicatorColor,
              child: Text('其他登录方式'),
              onPressed: () {
                widget.tapFlip(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}

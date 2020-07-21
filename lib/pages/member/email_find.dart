import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../iconfont.dart';

class EmailFindPage extends StatefulWidget {
  final Function(int mode) tapFlip;
  final String logo;
  EmailFindPage({
    Key key,
    this.tapFlip,
    this.logo,
  }) : super(key: key);

  @override
  _EmailFindPageState createState() => _EmailFindPageState();
}

class _EmailFindPageState extends State<EmailFindPage> {
  final formKey = GlobalKey<FormState>();
  String email, code, password, confirmPassword;
  bool isObscure = true;
  bool sent = false;

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
            sent
                ? Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '请输入安全代码',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '请输入安全代码';
                          }
                          return null;
                        },
                        onSaved: (newValue) => code = newValue,
                      ),
                      TextFormField(
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          labelText: '请输入密码',
                          suffixIcon: IconButton(
                            icon: Icon(
                                isObscure ? IconFont.eye : IconFont.eyeSlash),
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
                      TextFormField(
                        obscureText: isObscure,
                        decoration: InputDecoration(
                          labelText: '请确认密码',
                          suffixIcon: IconButton(
                            icon: Icon(
                                isObscure ? IconFont.eye : IconFont.eyeSlash),
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '请输入确认密码';
                          }
                          if (value != password) {
                            return '两次密码不一致';
                          }
                          return null;
                        },
                        onSaved: (newValue) => confirmPassword = newValue,
                      ),
                    ],
                  )
                : Container(),
            SizedBox(height: 30.0),
            RaisedButton(
              color: Theme.of(context).indicatorColor,
              textColor: Colors.white,
              child: Text(sent ? '重置密码' : '发送验证邮件'),
              onPressed: () {
                if (!formKey.currentState.validate()) {
                  return;
                }
                formKey.currentState.save();
                // todo
                setState(() {
                  sent = true;
                });
              },
            ),
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text('返回登录'),
                    onPressed: () {
                      widget.tapFlip(1);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

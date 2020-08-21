import 'package:flutter/material.dart';
import 'package:flutter_shop/models/dialog.dart';

import '../../iconfont.dart';

class EmailRegisterPage extends StatefulWidget {
  final Function(int mode) tapFlip;
  EmailRegisterPage({
    Key key,
    this.tapFlip,
  }) : super(key: key);

  @override
  _EmailRegisterPageState createState() => _EmailRegisterPageState();
}

class _EmailRegisterPageState extends State<EmailRegisterPage> {
  final formKey = GlobalKey<FormState>();
  String name, email, password, confirmPassword;
  bool agree = false;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: '请输入昵称',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入昵称';
                }
                return null;
              },
              onSaved: (newValue) => name = newValue,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
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
            TextFormField(
              obscureText: isObscure,
              decoration: InputDecoration(
                labelText: '请确认密码',
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
                  return '请输入确认密码';
                }
                if (value != password) {
                  return '两次密码不一致';
                }
                return null;
              },
              onSaved: (newValue) => confirmPassword = newValue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: agree,
                        onChanged: (val) {
                          setState(() {
                            agree = val;
                          });
                        },
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Text('同意《注册协议》'),
                        onPressed: () {
                          showAgreement(context);
                        },
                      ),
                    ],
                  ),
                ),
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
            RaisedButton(
              color: Theme.of(context).indicatorColor,
              textColor: Colors.white,
              child: Text('注册'),
              onPressed: () {
                if (!formKey.currentState.validate()) {
                  return;
                }
                formKey.currentState.save();
                // todo
              },
            ),
          ],
        ),
      ),
    );
  }

  Future showAgreement(BuildContext context) async {
    final action = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('注册协议'),
        content: Column(
          children: <Widget>[
            Text('本程序使用过程中产生的数据，不会对外公布，但会存储了服务器，直到用户注销，用户产生的数据都会被删除。'),
            Text('本商城只支持微信支付，因此订单以微信支付成功为准，以微信支付对账单为准。'),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context, DialogAction.Cancel);
            },
          ),
          FlatButton(
            child: Text('确认'),
            onPressed: () {
              Navigator.pop(context, DialogAction.Ok);
            },
          ),
        ],
      ),
    );
    if (action == DialogAction.Ok) {
      setState(() {
        agree = true;
      });
    }
  }
}

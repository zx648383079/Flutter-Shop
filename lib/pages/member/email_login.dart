import 'package:flutter/material.dart';
import 'package:flutter_shop/iconfont.dart';

class EmailloginPage extends StatefulWidget {
  EmailloginPage({Key key}) : super(key: key);

  @override
  _EmailloginPageState createState() => _EmailloginPageState();
}

class _EmailloginPageState extends State<EmailloginPage> {
  final formKey = GlobalKey<FormState>();
  String email, password;
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
                labelText: '请输入账号',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入账号';
                }
                return '';
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
                return '';
              },
              onSaved: (newValue) => password = newValue,
            ),
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    child: Text('注册账户'),
                    onPressed: () {},
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    child: Text('忘记密码'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            RaisedButton(
              child: Text('登录'),
              onPressed: () {
                if (!formKey.currentState.validate()) {
                  return;
                }
                formKey.currentState.save();
                // todo
              },
            ),
            RaisedButton(
              child: Text('其他登录方式'),
              onPressed: () {
                // todo
              },
            ),
          ],
        ),
      ),
    );
  }
}

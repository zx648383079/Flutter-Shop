import 'package:flutter/material.dart';

import '../../iconfont.dart';
import 'large_header.dart';

class EditPasswordPage extends StatefulWidget {
  EditPasswordPage({Key key}) : super(key: key);

  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final formKey = GlobalKey<FormState>();
  String oldPassword, password, confirmPassword;
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: LargeHeaderBar(
        title: '修改密码',
        onBack: () {
          Navigator.pop(context);
        },
        onSubmit: () {
          if (!formKey.currentState.validate()) {
            return;
          }
          formKey.currentState.save();
          // todo
        },
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              obscureText: isObscure,
              decoration: InputDecoration(
                labelText: '旧密码(未设可随便填入6位字符)',
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
              onSaved: (newValue) => oldPassword = newValue,
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
                return '';
              },
              onSaved: (newValue) => confirmPassword = newValue,
            ),
          ],
        ),
      ),
    );
  }
}

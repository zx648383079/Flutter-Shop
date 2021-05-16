import 'package:flutter/material.dart';
import 'package:flutter_shop/api/user.dart';
import 'package:flutter_shop/models/login.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../iconfont.dart';
import 'large_header.dart';

class EditPasswordPage extends StatefulWidget {
  EditPasswordPage({Key? key}) : super(key: key);

  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final formKey = GlobalKey<FormState>();
  String oldPassword = '', password = '', confirmPassword = '';
  bool isObscure = true;

  void tapSubmit() {
    if (oldPassword.length < 4) {
      showToast('请输入原密码！');
      return;
    }
    if (password.length < 4) {
      showToast('请输入新密码！');
      return;
    }
    if (oldPassword == password) {
      showToast('新密码不能和原密码一样！');
      return;
    }
    if (confirmPassword == password) {
      showToast('确认密码不一致！');
      return;
    }
    UserApi.updatePassword(PasswordForm(oldPassword, password, confirmPassword),
        (res) {
      showToast('密码修改成功！');
      Application.removeToken();
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

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
          if (!formKey.currentState!.validate()) {
            return;
          }
          formKey.currentState!.save();
          // todo
          tapSubmit();
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
                if (value == null || value.isEmpty) {
                  return '请输入密码';
                }
                return '';
              },
              onSaved: (newValue) => oldPassword = newValue ?? '',
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
                if (value == null || value.isEmpty) {
                  return '请输入密码';
                }
                return '';
              },
              onSaved: (newValue) => password = newValue ?? '',
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
                if (value == null || value.isEmpty) {
                  return '请输入确认密码';
                }
                if (value != password) {
                  return '两次密码不一致';
                }
                return '';
              },
              onSaved: (newValue) => confirmPassword = newValue ?? '',
            ),
          ],
        ),
      ),
    );
  }
}

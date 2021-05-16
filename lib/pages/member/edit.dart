import 'package:flutter/material.dart';
import 'package:flutter_shop/api/user.dart';
import 'package:flutter_shop/models/user.dart';
import 'package:flutter_shop/pages/member/large_header.dart';

import '../application.dart';

final profileNames = {'name': '昵称'};

class EditProfilePage extends StatefulWidget {
  final Map arguments;
  EditProfilePage({Key? key, required this.arguments}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();
  String field = '', value = '', title = '';
  User? user;
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    field = widget.arguments['field'];
    title = profileNames.containsKey(field) ? profileNames[field]! : '信息';
    Application.getUser().then((res) {
      setState(() {
        user = res;
        controller!.value = TextEditingValue(text: res!.name);
      });
    });
  }

  void updateProfile(String name, dynamic value) {
    UserApi.update({name: value}, (res) {
      Application.setUser(res);
      setState(() {
        user = res;
      });
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: LargeHeaderBar(
        title: '修改$title',
        onBack: () {
          Navigator.pop(context);
        },
        onSubmit: () {
          if (!formKey.currentState!.validate()) {
            return;
          }
          formKey.currentState!.save();
          // todo
          this.updateProfile(field, value);
        },
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: '请输入$title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '请输入$title';
                }
                return '';
              },
              onSaved: (newValue) => value = newValue ?? '',
            ),
          ],
        ),
      ),
    );
  }
}

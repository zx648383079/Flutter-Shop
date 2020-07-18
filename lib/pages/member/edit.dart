import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/member/large_header.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage({Key key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final formKey = GlobalKey<FormState>();
  String name, value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            LargeHeader(
              title: '修改昵称',
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
            TextFormField(
              decoration: InputDecoration(
                labelText: '请输入昵称',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入昵称';
                }
                return '';
              },
              onSaved: (newValue) => value = newValue,
            ),
          ],
        ),
      ),
    );
  }
}

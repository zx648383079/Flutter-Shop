import 'package:flutter/material.dart';

import '../../iconfont.dart';

class AddressEditPage extends StatefulWidget {
  AddressEditPage({Key key}) : super(key: key);

  @override
  _AddressEditPageState createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
  final formKey = GlobalKey<FormState>();
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
        title: Text('新增收货地址'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: '收货人',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入收货人';
                }
                return '';
              },
              onSaved: (newValue) => newValue,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: '手机号',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入手机号';
                }
                return '';
              },
              onSaved: (newValue) => newValue,
            ),
            TextFormField(
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: '详细地址',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '请输入详细地址';
                }
                return '';
              },
              onSaved: (newValue) => newValue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('设为默认地址'),
                Switch(value: false, onChanged: (value) => value)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('保存'),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('删除'),
            ),
          ],
        ),
      ),
    );
  }
}

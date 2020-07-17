import 'package:flutter/material.dart';

import '../../iconfont.dart';

class AddressEditPage extends StatefulWidget {
  AddressEditPage({Key key}) : super(key: key);

  @override
  _AddressEditPageState createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
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
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}

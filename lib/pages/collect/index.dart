import 'package:flutter/material.dart';

import '../../iconfont.dart';

class CollectPage extends StatefulWidget {
  CollectPage({Key key}) : super(key: key);

  @override
  _CollectPageState createState() => _CollectPageState();
}

class _CollectPageState extends State<CollectPage> {
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
        title: Text('我的关注'),
      ),
      body: Container(),
    );
  }
}

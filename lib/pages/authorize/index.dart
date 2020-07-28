import 'package:flutter/material.dart';
import 'package:flutter_shop/utils/index.dart';

import '../../iconfont.dart';

class AuthorizePage extends StatefulWidget {
  AuthorizePage({Key key}) : super(key: key);

  @override
  _AuthorizePageState createState() => _AuthorizePageState();
}

class _AuthorizePageState extends State<AuthorizePage> {
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
        title: Text(''),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: <Widget>[
                Center(
                  child: ClipOval(
                    child: Image.network(
                      getAssetUrl('assets/images/zx.jpg'),
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
                Center(
                  child: Text('正在授权WEB端登录'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('确认授权'),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text('取消授权'),
          ),
        ],
      ),
    );
  }
}

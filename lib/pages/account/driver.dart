import 'package:flutter/material.dart';
import 'package:flutter_shop/models/driver.dart';

import '../../iconfont.dart';

class DriverPage extends StatefulWidget {
  @override
  _DriverPageState createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  List<Driver> items = <Driver>[];

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
        title: Text('我的消息'),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('最新登录设备：点击可以查看登录时间'),
                ),
              ),
            ]),
            itemExtent: 50,
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var item = items[index];
              return Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(item.name),
                          Text(item.createdAt)
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      child: Icon(IconFont.chevronRight),
                    ),
                  ],
                ),
              );
            }, childCount: items.length),
            itemExtent: 60,
          ),
        ],
      ),
    );
  }
}

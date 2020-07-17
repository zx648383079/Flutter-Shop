import 'package:flutter/material.dart';
import 'package:flutter_shop/models/order.dart';

import '../../iconfont.dart';

class OrderLogisticsPage extends StatefulWidget {
  OrderLogisticsPage({Key key}) : super(key: key);

  @override
  _OrderLogisticsPageState createState() => _OrderLogisticsPageState();
}

class _OrderLogisticsPageState extends State<OrderLogisticsPage> {
  List<Logistics> items = <Logistics>[];
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
        title: Text('物流信息'),
      ),
      body: showLogistics(context),
    );
  }

  Widget showLogistics(BuildContext context) {
    if (items.length < 1) {
      return Container(
        child: Center(
          child: Text('暂无物流信息'),
        ),
      );
    }
    var children = <Widget>[];
    var last = '';
    final reg = new RegExp(r'(\d{4})-(\d{2})(-\d{2} \d{2}:\d{2})');
    for (var item in items) {
      var match = reg.firstMatch(item.createdAt);
      if (match.groupCount < 0) {
        continue;
      }
      var current = match[1] + '年' + match[2] + '月';
      if (last != current) {
        children.add(Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(current),
          ),
        ));
        last = current;
      }
      children.add(Container(
        child: Column(
          children: <Widget>[Text(item.content), Text(item.createdAt)],
        ),
      ));
    }
    return ListView(
      children: children,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/tab_item.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<TabItem> statusItems = <TabItem>[
    TabItem('全部', 0),
    TabItem('待支付', ORDER_STATUS.UN_PAY),
    TabItem('待收货', ORDER_STATUS.SHIPPED),
    TabItem('已完成', ORDER_STATUS.FINISH),
    TabItem('已取消', ORDER_STATUS.CANCEL),
  ];
  int status = 0;
  List<Order> items = <Order>[];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/models/order.dart';

List<Widget> orderAction(BuildContext context, Order item,
    {bool isDetail = false}) {
  var actions = <Widget>[
    Expanded(
      child: SizedBox(),
    ),
  ];
  if (item.status == ORDER_STATUS.UN_PAY) {
    actions.add(RaisedButton(
      onPressed: () {},
      child: Text('支付'),
    ));
  }
  if (!isDetail) {
    actions.add(FlatButton(
      child: Text('详情'),
      onPressed: () {
        Navigator.pushNamed(context, '/order/detail',
            arguments: {'id': item.id});
      },
    ));
  }

  if (item.status == ORDER_STATUS.SHIPPED) {
    actions.add(RaisedButton(
      onPressed: () {},
      child: Text('确认收货'),
    ));
  }
  if (item.status == ORDER_STATUS.RECEIVED) {
    actions.add(RaisedButton(
      onPressed: () {},
      child: Text('评价'),
    ));
  }
  if (item.status == ORDER_STATUS.SHIPPED ||
      item.status == ORDER_STATUS.PAID_UN_SHIP) {
    actions.add(RaisedButton(
      onPressed: () {},
      child: Text('申请退款'),
    ));
  }
  if (item.status == ORDER_STATUS.RECEIVED) {
    actions.add(RaisedButton(
      onPressed: () {},
      child: Text('退换货'),
    ));
  }
  if (item.status == ORDER_STATUS.FINISH) {
    actions.add(RaisedButton(
      onPressed: () {},
      child: Text('售后'),
    ));
  }
  if (item.status == ORDER_STATUS.UN_PAY ||
      item.status == ORDER_STATUS.PAID_UN_SHIP) {
    actions.add(RaisedButton(
      onPressed: () {},
      child: Text('取消'),
    ));
  }
  return actions;
}

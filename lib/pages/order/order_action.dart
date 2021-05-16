import 'package:flutter/material.dart';
import 'package:flutter_shop/api/order.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/pages/member/confirm_dialog.dart';

List<Widget> orderAction(BuildContext context, Order item,
    {bool isDetail = false, Function(Order order)? changed}) {
  var actions = <Widget>[
    Expanded(
      child: SizedBox(),
    ),
  ];
  if (item.status == ORDER_STATUS.UN_PAY) {
    actions.add(ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/pay', arguments: {'id': item.id});
      },
      child: Text('支付'),
    ));
  }
  if (!isDetail) {
    actions.add(ElevatedButton(
      child: Text('详情'),
      onPressed: () {
        Navigator.pushNamed(context, '/order/detail',
            arguments: {'id': item.id});
      },
    ));
  }

  if (item.status == ORDER_STATUS.SHIPPED) {
    actions.add(ElevatedButton(
      onPressed: () {
        showConfirmDilaog(context, message: '确认已收到商品？').then((value) {
          if (value != true) {
            return;
          }
          OrderApi.receive(item.id, (res) {
            if (changed != null) {
              changed(res);
            }
          });
        });
      },
      child: Text('确认收货'),
    ));
  }
  if (item.status == ORDER_STATUS.RECEIVED) {
    actions.add(ElevatedButton(
      onPressed: () {},
      child: Text('评价'),
    ));
  }
  if (item.status == ORDER_STATUS.SHIPPED ||
      item.status == ORDER_STATUS.PAID_UN_SHIP) {
    actions.add(ElevatedButton(
      onPressed: () {},
      child: Text('申请退款'),
    ));
  }
  if (item.status == ORDER_STATUS.RECEIVED) {
    actions.add(ElevatedButton(
      onPressed: () {},
      child: Text('退换货'),
    ));
  }
  if (item.status == ORDER_STATUS.FINISH) {
    actions.add(ElevatedButton(
      onPressed: () {},
      child: Text('售后'),
    ));
  }
  if (item.status == ORDER_STATUS.UN_PAY ||
      item.status == ORDER_STATUS.PAID_UN_SHIP) {
    actions.add(ElevatedButton(
      onPressed: () {
        showConfirmDilaog(context, message: '确认取消此订单？').then((value) {
          if (value != true) {
            return;
          }
          OrderApi.cancel(item.id, (res) {
            if (changed != null) {
              changed(res);
            }
          });
        });
      },
      child: Text('取消'),
    ));
  }
  return actions;
}

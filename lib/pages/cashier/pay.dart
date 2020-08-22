import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/cart.dart';
import 'package:flutter_shop/api/order.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/payment.dart';
import 'package:flutter_shop/pages/application.dart';

class PayPage extends StatefulWidget {
  final Map arguments;
  PayPage({Key key, this.arguments}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  Order order;
  Payment payment;
  List<Payment> paymentItems = [];

  @override
  void initState() {
    super.initState();
    Application.getOrder(widget.arguments['id'], (res) {
      order = res;
      setState(() {});
      refreshPayment();
    });
  }

  void refreshPayment() {
    OrderApi.getPaymentList(order.id, (res) {
      var items = <Payment>[];
      for (var item in res.data) {
        if (item.id == order.paymentId) {
          payment = item;
          continue;
        }
        items.add(item);
      }
      paymentItems = items;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('支付'),
      ),
      body: showBox(),
      bottomNavigationBar: RaisedButton(
        color: Color(0xffd22222),
        textColor: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        onPressed: () {},
        child: Text('立即支付'),
      ),
    );
  }

  Widget showBox() {
    if (order == null) {
      return Container();
    }
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              height: 120,
              child: Center(
                child: Text(
                  '￥${order.orderAmount}',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('商品总价'),
                Text('￥${order.goodsAmount}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('+运费'),
                Text('￥${order.shippingFee}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('+支付手续费'),
                Text('￥${order.payFee}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('-优惠'),
                Text('￥${order.discount}'),
              ],
            ),
            paymentView(),
            paymentHr(),
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return paymentItem(paymentItems[index]);
          }, childCount: paymentItems.length),
        ),
      ],
    );
  }

  Widget paymentHr() {
    if (paymentItems.length < 1) {
      return Container();
    }
    return Container(
      child: Text('选择其他支付方式'),
    );
  }

  Widget paymentView() {
    if (payment == null) {
      return Container();
    }
    return paymentItem(payment);
  }

  Widget paymentItem(Payment item) {
    return Container(
      color: Colors.white,
      height: 40,
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            width: 40,
            height: 40,
            imageUrl: item.icon,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(item.name),
            ),
          ),
          Container(
            width: 40,
            child: item.id == order.paymentId ? Icon(IconFont.check) : null,
          )
        ],
      ),
    );
  }
}

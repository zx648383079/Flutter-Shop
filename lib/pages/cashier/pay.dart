import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/payment.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('结算'),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 80,
                child: Center(
                  child: Text('￥${order.orderAmount}'),
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
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {},
        child: Text('立即支付'),
      ),
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

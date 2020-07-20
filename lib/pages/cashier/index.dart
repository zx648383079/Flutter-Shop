import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/address.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/payment.dart';
import 'package:flutter_shop/models/shipping.dart';

import '../../iconfont.dart';

class CashierPage extends StatefulWidget {
  @override
  _CashierPageState createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  Address address;
  List<CartGroup> items;
  Order order;
  List<Payment> paymentItems = [];
  Payment payment;
  List<Shipping> shippingItems = [];
  Shipping shipping;

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
              addressView(context),
              Divider(
                height: 2,
              ),
              paymentView(context),
              Divider(
                height: 2,
              ),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var group = items[index];
              return Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(group.name),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((c, i) {
                        var goods = group.goodsList[i];
                        return Container(
                          child: Row(
                            children: <Widget>[
                              CachedNetworkImage(
                                width: 70,
                                height: 70,
                                imageUrl: goods.goods.thumb,
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(goods.goods.name),
                                    Text('￥${goods.price}'),
                                    Text('x ${goods.amount}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }, childCount: group.goodsList.length),
                    ),
                    shippingView(context),
                    Divider(
                      height: 2,
                    ),
                  ],
                ),
              );
            }, childCount: items.length),
          ),
          orderPreview(),
        ],
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }

  Widget orderPreview() {
    if (order == null) {
      return null;
    }
    return SliverList(
      delegate: SliverChildListDelegate(<Widget>[
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('订单总价'),
            Text('￥${order.orderAmount}'),
          ],
        ),
      ]),
    );
  }

  Widget shippingView(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text('配送方式'),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(shipping == null ? '请选择' : shipping.name),
            ),
          ),
          Container(
            child: Icon(IconFont.chevronRight),
          ),
        ],
      ),
    );
  }

  Widget paymentView(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text('支付方式'),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(payment == null ? '请选择' : payment.name),
            ),
          ),
          Container(
            child: Icon(IconFont.chevronRight),
          ),
        ],
      ),
    );
  }

  Widget addressView(BuildContext context) {
    if (address == null) {
      return Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(IconFont.map),
            ),
            Expanded(
              child: Center(
                child: Text('请添加地址'),
              ),
            ),
            Container(
              child: IconButton(
                onPressed: () {},
                icon: Icon(IconFont.chevronRight),
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: Icon(IconFont.map),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(address.name),
                    Text(address.tel),
                  ],
                ),
                Text('${address.regionName} ${address.address}')
              ],
            ),
          ),
          Container(
            child: IconButton(
              onPressed: () {},
              icon: Icon(IconFont.chevronRight),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    if (address == null) {
      return Container();
    }
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Text('${address.regionName} ${address.address}'),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('￥0'),
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text('立即支付'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

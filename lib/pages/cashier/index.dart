import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/cart.dart';
import 'package:flutter_shop/models/address.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/payment.dart';
import 'package:flutter_shop/models/shipping.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:flutter_shop/pages/cashier/select_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../iconfont.dart';

class CashierPage extends StatefulWidget {
  @override
  _CashierPageState createState() => _CashierPageState();
}

class _CashierPageState extends State<CashierPage> {
  Address address;
  List<CartGroup> items = [];
  Order order;
  List<Payment> paymentItems = [];
  Payment payment;
  List<Shipping> shippingItems = [];
  Shipping shipping;
  List<int> cartIdItems;

  @override
  void initState() {
    super.initState();
    items = Application.cart;
    cartIdItems = [];
    for (var group in items) {
      for (var cart in group.goodsList) {
        cartIdItems.add(cart.id);
      }
    }
    Application.getAddress((res) {
      setState(() {
        address = res;
      });
      onAddressChanged();
    });
    CartApi.getPaymentList(cartIdItems, 0, (res) {
      paymentItems = res.data;
    });
  }

  void onAddressChanged() {
    if (address == null) {
      return;
    }
    CartApi.getShippingList(cartIdItems, address.id, 0, (res) {
      shippingItems = res.data;
    });
    refreshPrice();
  }

  void refreshPrice() {
    if (address == null) {
      return;
    }
    CartApi.previewOrder(
        cartIdItems,
        address.id,
        shipping == null ? 0 : shipping.id,
        payment == null ? 0 : payment.id,
        0, (res) {
      setState(() {
        order = res;
      });
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void tapCheckout() {
    if (address == null) {
      showToast('请选择收货地址');
      return;
    }
    if (cartIdItems.length < 1) {
      showToast('请选择结算商品');
      return;
    }
    if (payment == null) {
      showToast('请选择支付方式');
      return;
    }
    if (shipping == null) {
      showToast('请选择配送方式');
      return;
    }
    CartApi.checkoutOrder(cartIdItems, address.id, shipping.id, payment.id, 0,
        (res) {
      Application.order = res;
      Navigator.pushReplacementNamed(context, '/pay',
          arguments: {'id': res.id});
    }, (code, msg) {
      showToast(msg);
    });
  }

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
          productView(),
          orderPreview(),
        ],
      ),
      bottomNavigationBar: bottomBar(context),
    );
  }

  Widget productView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        var group = items[index];
        return Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                child: Text(group.name),
              ),
              CustomScrollView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((c, i) {
                      var goods = group.goodsList[i];
                      return Container(
                        color: Colors.white,
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
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(goods.goods.name),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text('￥${goods.price}'),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text('x ${goods.amount}'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }, childCount: group.goodsList.length),
                  ),
                ],
              ),
              shippingView(context),
              Divider(
                height: 2,
              ),
            ],
          ),
        );
      }, childCount: items.length),
    );
  }

  Widget orderPreview() {
    if (order == null) {
      return SliverFixedExtentList(
        delegate: SliverChildListDelegate([]),
        itemExtent: 1,
      );
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
            Text(order.shippingFee == null ? '￥0' : '￥${order.shippingFee}'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('+支付手续费'),
            Text(order.payFee == null ? '￥0' : '￥${order.payFee}'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('-优惠'),
            Text(order.discount == null ? '￥0' : '￥${order.discount}'),
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
    return InkWell(
      child: Container(
        color: Colors.white,
        height: 40,
        child: Row(
          children: <Widget>[
            Container(
              child: Text('配送方式'),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(shipping == null ? '请选择' : shipping.name),
              ),
            ),
            Container(
              width: 40,
              child: Icon(IconFont.chevronRight),
            ),
          ],
        ),
      ),
      onTap: () {
        showSelectDialog(
          context,
          items: shippingItems,
          selected: shipping == null ? 0 : shipping.id,
          title: '配送方式',
        ).then((value) {
          if (value == null) {
            return;
          }
          shipping = value;
          refreshPrice();
        });
      },
    );
  }

  Widget paymentView(BuildContext context) {
    return InkWell(
      child: Container(
        color: Colors.white,
        height: 40,
        child: Row(
          children: <Widget>[
            Container(
              child: Text('支付方式'),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(payment == null ? '请选择' : payment.name),
              ),
            ),
            Container(
              width: 40,
              child: Icon(IconFont.chevronRight),
            ),
          ],
        ),
      ),
      onTap: () {
        showSelectDialog(
          context,
          items: paymentItems,
          selected: payment == null ? 0 : payment.id,
          title: '支付方式',
        ).then((value) {
          if (value == null) {
            return;
          }
          payment = value;
          refreshPrice();
        });
      },
    );
  }

  Widget addressView(BuildContext context) {
    var child = address == null
        ? Center(
            child: Text('请添加地址'),
          )
        : Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    address.name,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(address.tel),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('${address.region.fullName} ${address.address}'),
              ),
            ],
          );
    return InkWell(
      child: Container(
        color: Colors.white,
        height: 80,
        child: Row(
          children: <Widget>[
            Container(
              width: 60,
              child: Icon(
                IconFont.map,
                size: 40,
              ),
            ),
            Expanded(
              child: child,
            ),
            Container(
              width: 40,
              child: IconButton(
                onPressed: () {},
                icon: Icon(IconFont.chevronRight),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (Application.addressItems.length < 1) {
          Navigator.pushNamed(context, '/address/create',
              arguments: {'back': 1}).then((value) {});
          return;
        }
        Navigator.pushNamed(context, '/address', arguments: {
          'back': 1,
          'seleted': address == null ? 0 : address.id
        }).then((value) {});
      },
    );
  }

  Widget bottomBar(BuildContext context) {
    if (address == null) {
      return null;
    }
    return Container(
      height: 70,
      child: Column(
        children: <Widget>[
          Container(
            height: 20,
            color: Color(0xffffe4c4),
            alignment: Alignment.centerLeft,
            child: Text(
              '${address.region.fullName} ${address.address}',
              style: TextStyle(color: Colors.red),
            ),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color(0xffb4282d),
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child:
                        Text(order == null ? '加载中' : '￥${order.orderAmount}'),
                  ),
                ),
                InkWell(
                  child: Container(
                    width: 90,
                    height: 50,
                    color: Color(0xffb4282d),
                    margin: EdgeInsets.only(left: 2),
                    alignment: Alignment.center,
                    child: Text(
                      '立即支付',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: tapCheckout,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

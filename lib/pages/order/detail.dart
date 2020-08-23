import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/order.dart';
import 'package:flutter_shop/models/order.dart';

import '../../iconfont.dart';
import 'order_action.dart';

class OrderDetailPage extends StatefulWidget {
  final Map arguments;
  OrderDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  Order data;

  @override
  void initState() {
    super.initState();
    OrderApi.get(widget.arguments['id'], (res) {
      setState(() {
        data = res;
      });
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
        title: Text('订单详情'),
      ),
      body: showOrder(context),
    );
  }

  Widget showOrder(BuildContext context) {
    if (data == null) {
      return Container(
        child: CircularProgressIndicator(),
      );
    }
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              height: 120,
              child: Center(
                child: Text(
                  data.statusLabel,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 60,
                    child: Icon(
                      IconFont.map,
                      size: 40,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              data.address.name,
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(data.address.tel),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              '${data.address.regionName} ${data.address.address}'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var e = data.goods[index];
              return Container(
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: e.thumb,
                      width: 100.0,
                      height: 100.0,
                      placeholder: (context, url) => new Icon(
                        Icons.image,
                        color: Colors.grey[300],
                        size: 100.0,
                      ),
                      errorWidget: (context, url, error) => new Icon(
                        Icons.image,
                        color: Colors.grey[300],
                        size: 100.0,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              e.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey[400], fontSize: 14.0),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  e.price.toString(),
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 22.0),
                                ),
                                Text(
                                  e.amount > 0 ? 'x${e.amount}' : '',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 14.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            childCount: data.goods.length,
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate(<Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text('共${data.goods.length}件，合计：￥${data.goodsAmount}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('订单号'),
                Text(data.seriesNumber),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('下单时间'),
                Text(data.createdAt),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('支付时间'),
                Text(data.payAt),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('发货时间'),
                Text(data.shippingAt),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('签收时间'),
                Text(data.receiveAt),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('完成时间'),
                Text(data.finishAt),
              ],
            ),
            Divider(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('商品总价'),
                Text('￥${data.goodsAmount}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('+运费'),
                Text('￥${data.shippingFee}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('+支付手续费'),
                Text('￥${data.payFee}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('-优惠'),
                Text('￥${data.discount}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('订单总价'),
                Text('￥${data.orderAmount}'),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: orderAction(
                context,
                data,
                isDetail: true,
                changed: (order) {
                  data = order;
                  setState(() {});
                },
              ),
            )
          ]),
          itemExtent: 30,
        ),
      ],
    );
  }
}

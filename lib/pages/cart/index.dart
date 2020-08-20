import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/cart.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with AutomaticKeepAliveClientMixin<CartPage> {
  @override
  bool get wantKeepAlive => true;
  List<CartGroup> items = [];
  bool checkedAll = false;
  bool isGuest = false;
  bool isLoading = false;
  double total = 0;
  List<int> checkId = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var group = items[index];
              return Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 50,
                            child: IconButton(
                              icon: Icon(IconFont.circle),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: Text(group.name),
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((c, i) {
                        var goods = group.goodsList[i];
                        return Container(
                          child: Stack(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    width: 50,
                                    child: IconButton(
                                      icon: Icon(IconFont.circle),
                                      onPressed: () {},
                                    ),
                                  ),
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(IconFont.minus),
                                      onPressed: () {},
                                    ),
                                    TextField(),
                                    IconButton(
                                      icon: Icon(IconFont.plus),
                                      onPressed: () {},
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
              );
            }, childCount: items.length),
          ),
        ],
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget bottomBar() {
    if (items.length < 1) {
      return null;
    }
    return Container(
      height: 40,
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            child: IconButton(
              icon: Icon(IconFont.circle),
              onPressed: () {},
            ),
          ),
          Container(
            width: 60,
            child: FlatButton(
              onPressed: () {},
              child: Text('全选'),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('￥0'),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {},
              child: Text('结算'),
            ),
          )
        ],
      ),
    );
  }
}

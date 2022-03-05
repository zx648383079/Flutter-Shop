import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/cart.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  List<int> checkId = [];
  final refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    refreshUser();
  }

  double get total {
    var total = 0.0;
    if (items == null || items.length < 1) {
      return total;
    }
    for (var item in items) {
      for (var cart in item.goodsList) {
        if (cart.isChecked && cart.price > 0) {
          total += cart.amount * cart.price;
        }
      }
    }
    return total;
  }

  void refreshUser() {
    isGuest = Application.token == null;
    if (isGuest) {
      return;
    }
    tapRefresh();
  }

  void tapRefresh() {
    isGuest = Application.token == null;
    if (isLoading) {
      return;
    }
    isLoading = true;
    CartApi.get((res) {
      setState(() {
        items = res.data;
        isLoading = false;
      });
      refreshController.refreshCompleted();
    }, (code, message) {
      setState(() {});
      refreshController.refreshCompleted();
    });
  }

  void toggleCheckAll() {
    checkedAll = !checkedAll;
    for (var item in items) {
      item.checked = checkedAll;
      for (var cart in item.goodsList) {
        cart.isChecked = checkedAll;
      }
    }
    setState(() {});
  }

  void toggleCheckGroup(CartGroup item) {
    item.checked = !item.checked;
    for (var cart in item.goodsList) {
      cart.isChecked = item.checked;
    }
    if (!item.checked) {
      this.checkedAll = false;
    }
    setState(() {});
  }

  void toggleCheck(CartGroup item, CartItem cart) {
    cart.isChecked = !cart.isChecked;
    if (!cart.isChecked) {
      checkedAll = false;
      item.checked = false;
    }
    setState(() {});
  }

  void updateAmount(CartItem cart, int value) {
    if (value < 1) {
      value = 1;
    }
    CartApi.updateItem(cart.id, value, (res) {
      cart.amount = value;
      setState(() {});
    });
  }

  void tapCashier() {
    var data = <CartGroup>[];
    for (var item in items) {
      var goodsItems =
          item.goodsList.where((element) => element.isChecked).toList();
      if (goodsItems.length < 1) {
        continue;
      }
      var group = CartGroup(item.shop, item.name, item.checked, goodsItems);
      data.add(group);
    }
    if (data.length < 1) {
      Fluttertoast.showToast(
        msg: '请选择结算的商品',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return;
    }
    Application.setCart(data);
    Navigator.pushNamed(context, '/cashier');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        controller: refreshController,
        onRefresh: tapRefresh,
        child: showBox(),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget showBox() {
    if (isGuest) {
      return Center(
        child: Container(
          height: 100,
          child: Column(
            children: [
              Text(
                '登录后可同步购物车中商品',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login').then((value) {
                    refreshUser();
                  });
                },
                child: Text('登录'),
              ),
            ],
          ),
        ),
      );
    }
    if (items.length < 1) {
      return Center(
        child: Container(
          height: 100,
          child: Column(
            children: [
              Text(
                '购物车是空的',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                child: Text('去逛逛'),
              ),
            ],
          ),
        ),
      );
    }
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            var group = items[index];
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          child: IconButton(
                            icon: Icon(group.checked != null && group.checked
                                ? IconFont.checkCircle
                                : IconFont.circle),
                            onPressed: () {
                              toggleCheckGroup(group);
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(group.name),
                        ),
                      ],
                    ),
                  ),
                  CustomScrollView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate((c, i) {
                          return Slidable(
                            key: UniqueKey(),
                            endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              extentRatio: 0.25,
                              children: <Widget>[
                                SlidableAction(
                                  label: '删除',
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete,
                                  onPressed: (context) {},
                                ),
                              ],
                            ),
                            child: productItem(group.goodsList[i], group),
                          );
                        }, childCount: group.goodsList.length),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }, childCount: items.length),
        ),
      ],
    );
  }

  Widget productItem(CartItem goods, CartGroup group) {
    return Container(
      height: 90,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50,
                child: IconButton(
                  icon: Icon(
                      goods.isChecked ? IconFont.checkCircle : IconFont.circle),
                  onPressed: () {
                    toggleCheck(group, goods);
                  },
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
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(goods.goods.name),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('￥${goods.price}'),
                    ),
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
                  icon: Icon(
                    IconFont.minus,
                    size: 12,
                  ),
                  onPressed: () {
                    updateAmount(goods, goods.amount - 1);
                  },
                ),
                Container(
                  width: 30,
                  height: 20,
                  alignment: Alignment.center,
                  child: Text(goods.amount.toString()),
                ),
                IconButton(
                  icon: Icon(
                    IconFont.plus,
                    size: 12,
                  ),
                  onPressed: () {
                    updateAmount(goods, goods.amount + 1);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget? bottomBar() {
    if (isGuest || items.length < 1) {
      return null;
    }
    return Container(
      height: 40,
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            child: IconButton(
              icon: Icon(checkedAll ? IconFont.checkCircle : IconFont.circle),
              onPressed: toggleCheckAll,
            ),
          ),
          Container(
            width: 60,
            child: TextButton(
              onPressed: toggleCheckAll,
              child: Text('全选'),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('￥$total'),
            ),
          ),
          InkWell(
            child: Container(
              width: 90,
              height: 40,
              color: Color(0xffb4282d),
              margin: EdgeInsets.only(left: 2),
              alignment: Alignment.center,
              child: Text(
                '结算',
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: tapCashier,
          ),
        ],
      ),
    );
  }
}

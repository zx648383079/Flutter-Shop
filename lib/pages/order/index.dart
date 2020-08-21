import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/order.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/order.dart';
import 'package:flutter_shop/models/search.dart';
import 'package:flutter_shop/models/tab_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'order_action.dart';

class OrderPage extends StatefulWidget {
  final Map arguments;
  OrderPage({Key key, this.arguments}) : super(key: key);

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
  int tabIndex = 0;
  List<Order> items = <Order>[];
  int page = 1;
  bool hasMore = true;
  bool isLoading = false;
  final refreshController = RefreshController(initialRefresh: false);
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: statusItems.length,
      vsync: ScrollableState(),
    );
    tabController.addListener(() {
      tabIndex = tabController.index;
      tapRefresh();
    });
    tapRefresh();
  }

  void tapRefresh() {
    tapPage(1, (suc) {
      refreshController.refreshCompleted();
    });
  }

  void tapMore() {
    if (!hasMore) {
      refreshController.loadComplete();
      return;
    }
    tapPage(page + 1, (suc) {
      refreshController.loadComplete();
    });
  }

  void tapPage(int p, Function finish) {
    if (isLoading) {
      finish(true);
      return;
    }
    isLoading = true;
    OrderApi.getList(
      OrderForm(
        p,
        status: statusItems[tabIndex].value,
      ),
      (res) {
        setState(() {
          page = p;
          isLoading = false;
          hasMore = res.paging.more;
          if (p < 2) {
            items = res.data;
          } else {
            items.addAll(res.data);
          }
        });
        finish(true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: hasMore,
        controller: refreshController,
        onLoading: tapMore,
        onRefresh: tapRefresh,
        child: ListView.builder(
          itemBuilder: (context, index) => orderItem(context, index),
          itemCount: items.length,
        ),
      ),
    );
  }

  Widget orderItem(BuildContext context, int index) {
    var item = items[index];
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '订单号：${item.id}',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                item.statusLabel,
                style: TextStyle(color: Colors.orange[600], fontSize: 16.0),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: item.goods
                .map(
                  (e) => InkWell(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        e.thumb == null
                            ? Container(
                                width: 100.0,
                                height: 100.0,
                              )
                            : CachedNetworkImage(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          color: Colors.grey[400],
                                          fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('共${item.goods.length}件，合计：￥${item.goodsAmount}'),
          ),
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: orderAction(context, item),
          ),
        )
      ],
    );
  }

  Widget header(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(IconFont.chevronLeft),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text('我的订单'),
      bottom: TabBar(
        tabs: statusItems
            .map((e) => Container(
                  height: 30,
                  child: Text(
                    e.name,
                  ),
                ))
            .toList(),
        controller: tabController,
      ),
    );
  }
}

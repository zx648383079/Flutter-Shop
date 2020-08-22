import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/api/comment.dart';
import 'package:flutter_shop/api/product.dart';
import 'package:flutter_shop/api/user.dart';
import 'package:flutter_shop/models/comment.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/utils/types.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../iconfont.dart';
import 'cart_dialog.dart';

class GoodsPage extends StatefulWidget {
  final Map arguments;
  GoodsPage({Key key, this.arguments}) : super(key: key);

  @override
  _GoodsPageState createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  Product product;
  List<Product> items = [];
  List<Comment> commentItems = [];

  @override
  void initState() {
    super.initState();
    ProductApi.get(widget.arguments['id'], (res) {
      setState(() {
        product = res;
      });
      loadComment();
      loadRecommend();
      setHistory();
    });
  }

  void setHistory() {
    var id = product.id.toString();
    SharedPreferences.getInstance().then((prefs) {
      var data = prefs.getString(SET_GOODS_HISTORY);
      if (data == null) {
        data = id;
      } else {
        var ids = data.split(',');
        if (ids.indexOf(id) < 0) {
          ids.add(id);
        }
        data = ids.join(',');
      }
      prefs.setString(SET_GOODS_HISTORY, data);
    });
  }

  void loadComment() {
    if (product == null) {
      return;
    }
    CommentApi.getSubtotal(product.id, (res) {
      setState(() {
        commentItems = res.comments;
      });
    });
  }

  void loadRecommend() {
    if (product == null) {
      return;
    }
    ProductApi.getRecommend(product.id, (res) {
      setState(() {
        items = res.data;
      });
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
        title: Text('商品详情'),
      ),
      body: showBody(),
      bottomNavigationBar: bottomBar(context),
    );
  }

  Widget showBody() {
    if (product == null) {
      return Container();
    }
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            banner(),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(product.name),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        child: Container(
                          width: 50,
                          child: collectButton(context),
                        ),
                        onTap: () {
                          UserApi.toggleCollect(product.id, (res) {
                            product.isCollect = res.data;
                            setState(() {});
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('￥${product.price}'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('评价'),
                  IconButton(
                    icon: Icon(IconFont.chevronRight),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Text('暂无评价'),
              ),
            ),
          ]),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container();
            },
            childCount: commentItems.length,
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 0.7,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var item = items[index];
              return Container(
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: CachedNetworkImage(
                        imageUrl: item.thumb,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/goods',
                            arguments: {'id': item.id});
                      },
                    ),
                    Text(item.name),
                    Text('￥${item.price}'),
                  ],
                ),
              );
            },
            childCount: items.length,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(<Widget>[
            Container(
              child: Html(data: product.content),
            )
          ]),
        ),
      ],
    );
  }

  Widget collectButton(BuildContext context) {
    if (product.isCollect) {
      return Column(
        children: <Widget>[
          Icon(IconFont.collect),
          Text('已收藏'),
        ],
      );
    }
    return Column(
      children: <Widget>[
        Icon(IconFont.uncollect),
        Text('收藏'),
      ],
    );
  }

  Widget banner() {
    var banners = product.gallery == null
        ? <CommentImage>[CommentImage(product.image)]
        : product.gallery;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 360.0,
      child: Swiper(
        itemBuilder: (context, index) =>
            CachedNetworkImage(imageUrl: banners[index].image),
        itemCount: banners.length,
        autoplay: true,
        loop: true,
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    var children = <Widget>[
      menuItem('首页', IconFont.home, onTap: () {
        Navigator.pushNamed(context, '/');
      }),
      menuItem('分类', IconFont.table, onTap: () {
        Navigator.pushNamed(context, '/category');
      }),
      menuItem('购物车', IconFont.cart, onTap: () {
        Navigator.pushNamed(context, '/cart');
      }),
    ];
    if (product == null || product.stock < 1) {
      children.add(
        Expanded(
          child: Container(
            height: 60,
            color: Color(0xff77777),
            alignment: Alignment.center,
            child: Text('库存不足'),
          ),
        ),
      );
    } else {
      children.add(
        menuButton('加入购物车', Color(0xFFFF9600), onTap: () {
          showCartDialog(context, product).then((value) {
            if (value == null) {
              return;
            }
            Fluttertoast.showToast(
              msg: '已成功加入购物车',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          });
        }),
      );
      children.add(
        menuButton('立即购买', Colors.red, onTap: () {
          showCartDialog(context, product, isBuy: true).then((value) {});
        }),
      );
    }
    return Container(
      height: 60,
      child: Row(
        children: children,
      ),
    );
  }

  Widget menuButton(String name, Color color, {Function onTap}) {
    return Expanded(
      child: Container(
        color: color,
        child: InkWell(
          child: Align(
            child: Text(name),
          ),
          onTap: onTap,
        ),
      ),
    );
  }

  Widget menuItem(String name, IconData icon, {Function onTap}) {
    return Container(
      width: 50,
      child: InkWell(
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 30,
            ),
            Text(name),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}

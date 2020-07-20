import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_shop/models/comment.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../iconfont.dart';

class GoodsPage extends StatefulWidget {
  @override
  _GoodsPageState createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  Product product;
  List<Product> items = [];
  List<Comment> commentItems = [];

  @override
  Widget build(BuildContext context) {
    final Object args = ModalRoute.of(context).settings.arguments;
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
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              banner(),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[Text(product.name)],
                    ),
                  ),
                  Container(
                    width: 50,
                    child: collectButton(context),
                  ),
                ],
              ),
              Text('￥${product.price}'),
              SizedBox(
                height: 30,
              ),
              Container(
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
                      CachedNetworkImage(
                        imageUrl: item.thumb,
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
      ),
      bottomNavigationBar: bottomBar(context),
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
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            child: Column(
              children: <Widget>[
                Icon(IconFont.home),
                Text('首页'),
              ],
            ),
          ),
          Container(
            width: 50,
            child: Column(
              children: <Widget>[
                Icon(IconFont.table),
                Text('分类'),
              ],
            ),
          ),
          Container(
            width: 50,
            child: Column(
              children: <Widget>[
                Icon(IconFont.cart),
                Text('购物车'),
              ],
            ),
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              child: Text('加入购物车'),
            ),
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              child: Text('立即购买'),
            ),
          ),
        ],
      ),
    );
  }
}

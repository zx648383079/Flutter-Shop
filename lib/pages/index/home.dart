import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/ad.dart';
import 'package:flutter_shop/api/category.dart';
import 'package:flutter_shop/api/product.dart';
import 'package:flutter_shop/api/site.dart';
import 'package:flutter_shop/models/ad.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/models/site.dart';
import 'package:flutter_shop/pages/index/floor.dart';
import 'package:flutter_shop/pages/index/menu_icon.dart';
import 'package:flutter_shop/utils/index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  Site site =
      Site('', '1', getAssetUrl('assets/images/wap_logo.png'), 0, 0, 0, '￥');
  List<Ad> banners = <Ad>[];
  List<Category> categories = <Category>[];
  List<Product> hotItems = <Product>[];
  List<Product> newItems = <Product>[];
  List<Product> bestItems = <Product>[];

  @override
  bool get wantKeepAlive => true;

  @override
  Future initState() async {
    SiteApi.get((res) {
      setState(() {
        this.site = res;
      });
    });
    AdApi.banners((res) {
      setState(() {
        this.banners = res.data;
      });
    });
    CategoryApi.getList(0, (res) {
      setState(() {
        this.categories = res.data;
      });
    });
    ProductApi.getHome((res) {
      setState(() {
        hotItems = res.hotProducts;
        bestItems = res.bestProducts;
        newItems = res.newProducts;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Scaffold(
        appBar: appBar(),
        body: Container(
          child: Column(
            children: <Widget>[
              banner(),
              menu(),
              FloorPanel(title: '最新商品', items: newItems),
              FloorPanel(title: '热门商品', items: hotItems),
              FloorPanel(title: '推荐商品', items: bestItems),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: 0.9,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: MenuIcon(
            name: categories[index].name,
            icon: categories[index].icon,
          ),
        );
      }, childCount: categories.length),
    );
  }

  Widget banner() {
    return Swiper(
      itemBuilder: (context, index) =>
          CachedNetworkImage(imageUrl: banners[index].content),
      itemCount: banners.length,
      autoplay: true,
    );
  }

  SearchAppBar appBar() {
    return SearchAppBar(
      backgroundColor: Color(0xFF05A6B1),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: site.logo,
            width: 100,
          ),
          Expanded(
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.search),
                  Text('搜索商品, 共${site.goods}款好物')
                ],
              ),
              decoration: BoxDecoration(
                  color: Color(0xFFededed),
                  borderRadius: BorderRadius.all(const Radius.circular(2))),
            ),
          ),
          Container(
            child: IconButton(icon: Icon(Icons.message), onPressed: () {}),
            width: 54,
          )
        ],
      ),
    );
  }
}

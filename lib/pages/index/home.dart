import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/ad.dart';
import 'package:flutter_shop/api/category.dart';
import 'package:flutter_shop/api/product.dart';
import 'package:flutter_shop/models/ad.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/models/search.dart';
import 'package:flutter_shop/models/site.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:flutter_shop/pages/index/menu_icon.dart';
import 'package:flutter_shop/utils/index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'product_item.dart';
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
  void initState() {
    Application.getSite((res) {
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
        if (res.hotProducts != null) {
          hotItems = res.hotProducts;
        }
        if (res.bestProducts != null) {
          bestItems = res.bestProducts;
        }
        if (res.newProducts != null) {
          newItems = res.newProducts;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var items = <Widget>[
      SliverFixedExtentList(
        itemExtent: 200,
        delegate: SliverChildListDelegate(
          <Widget>[
            banner(),
          ],
        ),
      ),
      menu(),
    ];
    items.addAll(floor('最新商品', newItems));
    items.addAll(floor('热门商品', hotItems));
    items.addAll(floor('推荐商品', bestItems));

    return Scaffold(
      appBar: appBar(),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: items,
      ),
    );
  }

  List<Widget> floor(String title, List<Product> data) {
    if (data == null || data.length < 1) {
      return <Widget>[];
    }
    return <Widget>[
      SliverFixedExtentList(
        itemExtent: 60,
        delegate: SliverChildListDelegate(
          <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[100],
                      width: 1,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(title),
                ),
              ),
            ),
          ],
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          childAspectRatio: 0.7,
        ),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return ProductItem(
            item: data[index],
          );
        }, childCount: data.length),
      ),
    ];
  }

  Widget menu() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        childAspectRatio: 0.9,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        var item = categories[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/search/result',
                arguments: SearchForm(1, category: item.id));
          },
          child: MenuIcon(
            name: item.name,
            icon: item.icon,
          ),
        );
      }, childCount: categories.length),
    );
  }

  Widget banner() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Swiper(
        itemBuilder: (context, index) =>
            CachedNetworkImage(imageUrl: banners[index].content),
        itemCount: banners.length,
        autoplay: true,
        loop: true,
      ),
    );
  }

  SearchAppBar appBar() {
    return SearchAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: site.logo,
            width: 100,
          ),
          Expanded(
            child: InkWell(
              child: Container(
                height: 35,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search),
                    Text('搜索商品, 共${site.goods}款好物')
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFededed),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(2),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
          ),
          Container(
            child: IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  Navigator.pushNamed(context, '/message');
                }),
            width: 54,
          )
        ],
      ),
    );
  }
}

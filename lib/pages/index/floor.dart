import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/pages/index/product_item.dart';

class FloorPanel extends StatefulWidget {
  final String title;
  final ValueChanged<int> onCartTap;
  List<Product> items;
  FloorPanel({@required this.title, this.onCartTap, @required this.items});

  @override
  _FloorPanelState createState() => _FloorPanelState();
}

class _FloorPanelState extends State<FloorPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(widget.title),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 0.7,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ProductItem(
                item: widget.items[index],
              );
            }, childCount: widget.items.length),
          ),
        ],
      ),
    );
  }
}

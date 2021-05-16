import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product item;

  ProductItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(5.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: CachedNetworkImage(
              imageUrl: item.thumb,
              placeholder: (context, url) => new Icon(
                Icons.image,
                color: Colors.grey[300],
                size: MediaQuery.of(context).size.width / 2 - 10,
              ),
              errorWidget: (context, url, error) => new Icon(
                Icons.image,
                color: Colors.grey[300],
                size: MediaQuery.of(context).size.width / 2 - 10,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/goods',
                  arguments: {'id': item.id});
            },
          ),
          Container(height: 5.0),
          Text(
            item.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: <Widget>[
              Text(
                "￥" + item.price.toString(),
                style: TextStyle(color: Colors.red, fontSize: 20.0),
              ),
              Text(
                "￥" + item.marketPrice.toString(),
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

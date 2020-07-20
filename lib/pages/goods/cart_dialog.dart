import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/models/product.dart';

Future<Cart> showCartDialog(BuildContext context, Product product) {
  Completer<Cart> completer = Completer();
  var result = showModalBottomSheet(
    context: context,
    builder: (context) => CartDialog(),
  );
  result.then((v) {
    completer.complete(v);
  });
  return completer.future;
}

class CartDialog extends StatefulWidget {
  final Product product;
  CartDialog({Key key, this.product}) : super(key: key);

  @override
  _CartDialogState createState() => _CartDialogState();
}

class _CartDialogState extends State<CartDialog> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: widget.product.thumb,
                    height: 80,
                    width: 80,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text('￥${widget.product.price}'),
                        Text('库存：${widget.product.stock}'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('数量'),
                  Expanded(
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
              RaisedButton(
                onPressed: () {},
                child: Text('确认'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

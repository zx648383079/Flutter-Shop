import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/cart.dart';
import 'package:flutter_shop/iconfont.dart';
import 'package:flutter_shop/models/cart.dart';
import 'package:flutter_shop/models/product.dart';

Future<Cart> showCartDialog(BuildContext context, Product product,
    {bool isBuy = false}) {
  Completer<Cart> completer = Completer();
  var result = showModalBottomSheet(
    context: context,
    builder: (context) => CartDialog(
      product: product,
      isBuy: isBuy,
    ),
  );
  result.then((v) {
    completer.complete(v);
  });
  return completer.future;
}

class CartDialog extends StatefulWidget {
  final Product product;
  final bool isBuy;
  CartDialog({Key key, this.product, this.isBuy}) : super(key: key);

  @override
  _CartDialogState createState() => _CartDialogState();
}

class _CartDialogState extends State<CartDialog> {
  TextEditingController amountController;
  int amount = 1;

  @override
  void initState() {
    super.initState();
    amountController = TextEditingController();
    updateAmount(1);
  }

  void updateAmount(int value) {
    if (value < 1) {
      value = 1;
    } else if (value > widget.product.stock) {
      value = widget.product.stock;
    }
    amount = value;
    amountController.value = TextEditingValue(text: amount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    transform: Matrix4.translationValues(0, -20, 0),
                    child: CachedNetworkImage(
                      imageUrl: widget.product.thumb,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '￥${widget.product.price}',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('库存：${widget.product.stock}'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                        icon: Icon(IconFont.close),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(bottom: 60),
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text('数量'),
                    ),
                    Container(
                      width: 140,
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(IconFont.minus),
                            onPressed: () {
                              updateAmount(amount - 1);
                            },
                          ),
                          Container(
                            width: 40,
                            child: TextField(
                              controller: amountController,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                updateAmount(int.parse(value));
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(IconFont.plus),
                            onPressed: () {
                              updateAmount(amount + 1);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: RaisedButton(
            color: Color(0xffe4393c),
            textColor: Colors.white,
            onPressed: () {},
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('确认'),
          ),
        )
      ],
    );
  }

  void tapDoCart() {
    if (widget.product == null) {
      return;
    }
    if (!widget.isBuy) {
      CartApi.addGoods(widget.product.id, amount, (res) {
        Navigator.pop(context, res);
      });
      return;
    }
  }
}

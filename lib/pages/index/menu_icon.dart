import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  final String name;
  final String icon;
  MenuIcon({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: icon,
                width: 50.0,
                height: 50.0,
              ),
              Container(height: 5.0),
              Text(name),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/iconfont.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback onTap;
  MenuItem({
    Key key,
    this.icon,
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                child: Icon(icon),
                width: 50,
              ),
              Expanded(
                child: Text(this.label),
              ),
              Container(
                child: Icon(IconFont.chevronRight),
                width: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

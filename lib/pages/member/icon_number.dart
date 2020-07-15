import 'package:flutter/material.dart';

class IconNumber extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final GestureTapCallback onTap;
  IconNumber({
    Key key,
    this.icon,
    this.label,
    this.count,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[
      Icon(icon),
      Text(label),
    ];
    if (count != null && count > 0) {
      items.add(
        Positioned(
          child: Container(
            child: Text(count.toString()),
          ),
        ),
      );
    }
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: items,
        ),
      ),
    );
  }
}

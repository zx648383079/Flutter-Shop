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
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 40,
            ),
            SizedBox(
              width: 10,
            ),
            Text(label),
          ],
        ),
      ),
    ];
    if (count != null && count > 0) {
      items.add(
        Positioned(
          top: 0,
          left: MediaQuery.of(context).size.width / 4 - 10,
          child: Container(
            width: 20,
            height: 20,
            child: Center(
              child: Text(
                count.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
          ),
        ),
      );
    }
    return Container(
      height: 70,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: items,
        ),
      ),
    );
  }
}

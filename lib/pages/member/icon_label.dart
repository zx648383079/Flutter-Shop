import 'package:flutter/material.dart';

class Iconlabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback onTap;
  Iconlabel({
    Key key,
    this.icon,
    this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Row(
            children: <Widget>[
              Icon(icon),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../iconfont.dart';

class LargeHeader extends StatelessWidget {
  final String title;
  final GestureTapCallback onBack;
  final GestureTapCallback onSubmit;
  LargeHeader({
    Key key,
    this.title,
    this.onBack,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(title),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              icon: Icon(IconFont.chevronLeft),
              onPressed: onBack,
            ),
          ),
          Positioned(
            right: 20,
            bottom: 0,
            child: IconButton(
              icon: Icon(
                IconFont.check,
                size: 40,
              ),
              onPressed: onSubmit,
            ),
          ),
        ],
      ),
    );
  }
}

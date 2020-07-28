import 'package:flutter/material.dart';

import '../../iconfont.dart';

class LargeHeaderBar extends StatefulWidget implements PreferredSizeWidget {
  final double barHeight = 160;
  final String title;
  final Function onBack;
  final Function onSubmit;

  LargeHeaderBar({Key key, this.title, this.onBack, this.onSubmit})
      : super(key: key);

  @override
  _LargeHeaderBarState createState() => _LargeHeaderBarState();

  @override
  Size get preferredSize => new Size.fromHeight(barHeight);
}

class _LargeHeaderBarState extends State<LargeHeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.barHeight +
          MediaQuery.of(context).padding.top, // //自动设置为系统appbar高度
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          height: widget.barHeight,
          color: Theme.of(context).backgroundColor,
          child: Stack(
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                margin: EdgeInsets.only(bottom: 20),
                child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 60, bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.title,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(IconFont.chevronLeft),
                  onPressed: widget.onBack,
                ),
              ),
              Positioned(
                right: 20,
                bottom: 0,
                child: Container(
                  alignment: Alignment(0, 0),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(
                      IconFont.check,
                      size: 40,
                    ),
                    onPressed: widget.onSubmit,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
      height: 160 + MediaQuery.of(context).padding.top,
      child: Stack(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 60, bottom: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: IconButton(
              color: Colors.white,
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

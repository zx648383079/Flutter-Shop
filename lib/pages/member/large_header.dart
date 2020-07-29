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
          child: Stack(
            children: <Widget>[
              Container(
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
                bottom: 0,
                child: Container(
                  height: 20,
                  color: Theme.of(context).backgroundColor,
                  width: MediaQuery.of(context).size.width,
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
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 0), //阴影xy轴偏移量
                        blurRadius: 15.0, //阴影模糊程度
                        spreadRadius: 1.0, //阴影扩散程度
                      ),
                    ],
                  ),
                  child: IconButton(
                    color: Colors.white,
                    alignment: Alignment.center,
                    icon: Icon(
                      IconFont.check,
                      size: 25,
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

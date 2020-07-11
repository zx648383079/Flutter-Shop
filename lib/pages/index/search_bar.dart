import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget child; //从外部指定内容
  final Color backgroundColor; // 指定背景颜色
  SearchAppBar({this.child, this.backgroundColor}) : super();

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight +
          MediaQuery.of(context).padding.top, // //自动设置为系统appbar高度
      width: MediaQuery.of(context).size.width,
      color: widget.backgroundColor,
      child: SafeArea(
        top: true,
        bottom: false,
        child: widget.child,
      ),
    );
  }
}

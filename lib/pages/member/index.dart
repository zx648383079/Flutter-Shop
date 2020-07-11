import 'package:flutter/material.dart';
import 'package:flutter_shop/api/user.dart';
import 'package:flutter_shop/utils/index.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage>
    with AutomaticKeepAliveClientMixin<MemberPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Future initState() async {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: header,
          body: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }

  List<Widget> header(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        floating: true,
        pinned: true,
        snap: true,
        expandedHeight: 250,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('欢迎你，请登录'),
          background: Image.network(
            getAssetUrl('assets/images/zx.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];
  }
}

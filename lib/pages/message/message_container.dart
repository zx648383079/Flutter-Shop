import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/message.dart';
import 'package:flutter_shop/utils/time.dart';
import 'package:flutter_shop/widgets/rule_container.dart';

class MessageContainer extends StatefulWidget {
  final List<MessageBase>? items;
  final bool more;
  final int sender;
  final double maxTime;
  MessageContainer(
      {Key? key,
      this.items,
      this.more = false,
      this.sender = 0,
      this.maxTime = 600})
      : super(key: key);

  @override
  _MessageContainerState createState() => _MessageContainerState();
}

class _MessageContainerState extends State<MessageContainer> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: formatItems(),
    );
  }

  List<Widget> formatItems() {
    if (widget.items == null) {
      return <Widget>[];
    }
    var children = <Widget>[];
    var now = DateTime.now();
    DateTime? lastTime;
    var exist = <int>[];
    for (var item in widget.items!) {
      if (exist.indexOf(item.id) >= 0) {
        continue;
      }
      var time = Time.timestampTo(item.createdAt);
      if (lastTime == null || Time.secondDiffer(now, time) > widget.maxTime) {
        lastTime = time;
        children.add(buildTime(Time.formatAgo(time, now)));
      }
      exist.add(item.id);
      children.add(buildMessage(item));
    }
    return children;
  }

  Widget buildMessage(MessageBase item) {
    var isMe = item.user != null &&
        item.user!.id > 0 &&
        widget.sender == item.user!.id;
    var children = <Widget>[
      Container(
        child: RuleContainer(
          content: item.content,
          rules: item.extraRule,
        ),
      ),
    ];
    if (isMe) {
      children.add(CachedNetworkImage(
        imageUrl: item.user!.avatar,
        width: 80,
        height: 80,
      ));
    } else {
      children.insert(
        0,
        CachedNetworkImage(
          imageUrl: item.user!.avatar,
          width: 80,
          height: 80,
        ),
      );
    }
    return Container(
      alignment: Alignment.centerRight,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget buildTime(String text) {
    return Container(
      child: Center(
        child: Text(text),
      ),
    );
  }
}

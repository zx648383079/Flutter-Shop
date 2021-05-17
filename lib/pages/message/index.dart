import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/api/bulletin.dart';
import 'package:flutter_shop/models/bulletin.dart';
import 'package:flutter_shop/models/search.dart';
import 'package:flutter_shop/models/user_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../iconfont.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<UserItem> items = <UserItem>[];
  @override
  void initState() {
    super.initState();
    BulletinApi.users((res) {
      setState(() {
        items = res;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('我的消息'),
      ),
      body: Container(
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.comment),
                  text: '回复我的',
                ),
                Tab(
                  icon: Icon(Icons.alternate_email),
                  text: '@我',
                ),
                Tab(
                  icon: Icon(IconFont.star),
                  text: '收到的赞',
                ),
                Tab(
                  icon: Icon(Icons.computer),
                  text: '系统通知',
                ),
              ],
              onTap: (i) {},
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, i) {
                  var item = items[i];
                  return ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: item.avatar,
                    ),
                    title: Text(item.name),
                    subtitle: Text('暂无消息'),
                    trailing:
                        item.count > 0 ? Text(item.count.toString()) : null,
                    onTap: () {
                      Navigator.pushNamed(context, '/message/chat',
                          arguments: {'user': item.id});
                    },
                  );
                },
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/api/address.dart';
import 'package:flutter_shop/models/address.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../iconfont.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<Address> items = <Address>[];

  @override
  void initState() {
    super.initState();
    AddressApi.getList((res) {
      setState(() {
        items = res.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconFont.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('我的收货地址'),
      ),
      body: showItems(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/address/create');
        },
        child: Icon(IconFont.plus),
      ),
    );
  }

  Widget showItems(BuildContext context) {
    if (items.length < 1) {
      return Container(
        child: Center(
          child: Text('请添加地址'),
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = items[index];
        return Slidable(
          key: UniqueKey(),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Text(item.name.substring(0, 1)),
              foregroundColor: Colors.white,
            ),
            title: Row(
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  item.tel,
                ),
              ],
            ),
            subtitle: Text('${item.region.fullName} ${item.address}'),
            onTap: () {
              Navigator.pushNamed(context, '/address/edit',
                  arguments: {'id': item.id});
            },
          ),
          actions: item.isDefault
              ? []
              : <Widget>[
                  IconSlideAction(
                    caption: '设为默认',
                    color: Colors.blue,
                    icon: Icons.archive,
                    onTap: () {},
                  ),
                ],
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: '删除',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () {},
            ),
          ],
        );
      },
      itemCount: items.length,
    );
  }
}

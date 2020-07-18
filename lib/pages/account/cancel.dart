import 'package:flutter/material.dart';
import 'package:flutter_shop/models/dialog.dart';

import '../../iconfont.dart';

class CancelPage extends StatefulWidget {
  @override
  _CancelPageState createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  final List<String> items = <String>[
    '需要解绑手机',
    '需要解绑邮箱',
    '安全/隐私顾虑',
    '这是多余的账户',
  ];

  int selected = 0;

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
        title: Text('账户注销'),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('请选择注销原因：'),
                ),
              ),
            ]),
            itemExtent: 50,
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      child: Radio(
                        value: index,
                        groupValue: selected,
                        onChanged: (value) {
                          selected = value;
                        },
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(items[index]),
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: items.length),
            itemExtent: 30,
          ),
        ],
      ),
    );
  }

  Future showTip(BuildContext context) async {
    final action = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('账户注销确认'),
        content: RichText(
          text: TextSpan(
            text: '账户注销后，您所有的记录将永远消失。',
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('继续注销'),
            onPressed: () {
              Navigator.pop(context, DialogAction.Cancel);
            },
          ),
          FlatButton(
            child: Text('暂不注销'),
            onPressed: () {
              Navigator.pop(context, DialogAction.Ok);
            },
          ),
        ],
      ),
    );
    if (action == DialogAction.Ok) {
      Navigator.pop(context);
    }
  }
}

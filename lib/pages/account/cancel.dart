import 'package:flutter/material.dart';
import 'package:flutter_shop/api/account.dart';
import 'package:flutter_shop/pages/application.dart';
import 'package:flutter_shop/pages/member/confirm_dialog.dart';

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
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showTip(context);
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
        title: Text('账户注销'),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('请选择注销原因：'),
              ),
            ),
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
                          setState(() {
                            selected = value;
                          });
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
            itemExtent: 50,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                color: Theme.of(context).indicatorColor,
                textColor: Colors.white,
                onPressed: () {
                  AccountApi.cancelUser({'reason': items[selected]}, (res) {
                    showConfirmDilaog(context, message: '您的账户注销申请已提交，等待管理员确认。')
                        .then((value) {
                      Application.removeToken();
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    });
                  });
                },
                child: Text('确定注销'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showTip(BuildContext context) {
    showConfirmDilaog(context,
            title: '账户注销确认',
            message: '账户注销后，您所有的记录将永远消失。',
            yesLabel: '继续注销',
            cancelLabel: '暂不注销')
        .then((value) {
      if (value == false) {
        Navigator.pop(context);
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/models/check.dart';
import 'package:flutter_shop/models/day_item.dart';
import 'package:flutter_shop/utils/index.dart';

import '../../iconfont.dart';

class CheckInPage extends StatefulWidget {
  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  CheckIn todayChecked;
  List<DayItem> dayItems = <DayItem>[];
  String month;
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
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                height: 100,
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 60,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: buildButton(context),
                  ),
                ),
              ),
            ]),
            itemExtent: 100,
          ),
          SliverFixedExtentList(
            delegate: SliverChildListDelegate(<Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: buildDayGrid(context),
              ),
            ]),
            itemExtent: 400,
          ),
        ],
      ),
    );
  }

  Widget buildDayGrid(BuildContext context) {
    return Container(
      width: 336,
      height: 384,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(IconFont.chevronLeft),
                onPressed: () {},
              ),
              Expanded(
                child: Text(month),
              ),
              IconButton(
                icon: Icon(IconFont.chevronLeft),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text('一'),
              ),
              Expanded(
                child: Text('二'),
              ),
              Expanded(
                child: Text('三'),
              ),
              Expanded(
                child: Text('四'),
              ),
              Expanded(
                child: Text('五'),
              ),
              Expanded(
                child: Text('六'),
              ),
              Expanded(
                child: Text('日'),
              ),
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(buildDay,
                childCount: dayItems.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              childAspectRatio: 0.9,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDay(BuildContext context, int index) {
    var item = dayItems[index];
    if (item.day < 1) {
      return Container();
    }
    if (!item.isChecked) {
      return Container(
        child: Text(twoPad(item.day)),
      );
    }
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Icon(IconFont.check),
          ),
          Text(twoPad(item.day)),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    if (todayChecked == null) {
      return RaisedButton(
        onPressed: () {},
        child: Text('签到'),
      );
    }
    return Column(
      children: <Widget>[
        RaisedButton.icon(
          onPressed: () {},
          icon: Icon(IconFont.calendarCheck),
          label: Text('已签到'),
        ),
        Text('已连续签到${todayChecked.running}天，继续加油'),
      ],
    );
  }
}

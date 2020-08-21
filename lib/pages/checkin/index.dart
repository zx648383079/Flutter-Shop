import 'package:flutter/material.dart';
import 'package:flutter_shop/api/check.dart';
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
  void initState() {
    super.initState();
    canCheck();
    refreshDay();
  }

  void canCheck() {
    CheckApi.getCanCheckIn((res) {
      if (res == null || res.data == null) {
        return;
      }
      setState(() {
        todayChecked = res.data;
      });
    });
  }

  void refreshDay() {
    var now = new DateTime.now();
    setMonth(now.add(Duration(days: -now.day + 1)));
  }

  void checkToday() {
    if (todayChecked != null) {
      return;
    }
    CheckApi.checkIn((res) {
      if (res.data == null) {
        return;
      }
      setState(() {
        todayChecked = res.data;
      });
    });
  }

  DateTime getMonth() {
    return DateTime.parse(month + "-01");
  }

  void previousMonth() {
    setMonth(getMonth().add(Duration(days: -1)));
  }

  void nextMonth() {
    setMonth(getMonth().add(Duration(days: 31)));
  }

  void setMonth(DateTime date) {
    month = "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}";
    dayItems.clear();
    var start = date.weekday;
    var count =
        date.add(Duration(days: 31)).add(Duration(days: -date.day - 1)).day;
    start = start > 0 ? start - 1 : 6;
    for (int i = 0; i < count + start; i++) {
      dayItems.add(DayItem(i >= start ? i - start + 1 : 0, false));
    }
    setState(() {});
    getMonthChecked();
  }

  void getMonthChecked() {
    CheckApi.getMonth(month, (res) {
      if (res.data == null || res.data.length < 1) {
        return;
      }
      var items = List<int>();
      for (var item in res.data) {
        items.add(DateTime.parse(item.createdAt).day);
      }
      checkDay(items);
    });
  }

  void checkDay(List<int> items) {
    if (items.length < 1) {
      return;
    }
    for (var item in dayItems) {
      if (item.day > 0 && items.contains(item.day)) {
        item.isChecked = true;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
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
                height: 300,
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: buildButton(context),
                  ),
                ),
              ),
            ]),
            itemExtent: 200,
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
      color: Colors.white,
      width: 336,
      height: 384,
      transform: Matrix4.translationValues(0, -60, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(IconFont.chevronLeft),
                onPressed: () {
                  previousMonth();
                },
              ),
              Expanded(
                child: Text(
                  month,
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                icon: Icon(IconFont.chevronRight),
                onPressed: () {
                  nextMonth();
                },
              ),
            ],
          ),
          Container(
            height: 40,
            color: Color(0xFFEEEEEE),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '一',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '二',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '三',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '四',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '五',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '六',
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    '日',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[
              SliverGrid(
                delegate: SliverChildBuilderDelegate(buildDay,
                    childCount: dayItems.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 1,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildDay(BuildContext context, int index) {
    var item = dayItems[index];
    if (item.day < 1) {
      return Container(
        height: 40,
        width: 40,
      );
    }
    if (!item.isChecked) {
      return Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        child: Text(
          twoPad(item.day),
          textAlign: TextAlign.center,
        ),
      );
    }
    return Container(
      height: 40,
      width: 40,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xff006cff),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Icon(
                IconFont.check,
                size: 30,
                color: Color(0x4cffffff),
              ),
            ),
          ),
          Container(
            child: Text(
              twoPad(item.day),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    if (todayChecked == null) {
      return RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () {
          checkToday();
        },
        child: Text('签到'),
      );
    }
    return Column(
      children: <Widget>[
        RaisedButton.icon(
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: () {},
          icon: Icon(IconFont.calendarCheck),
          label: Text('已签到'),
        ),
        Text(
          '已连续签到${todayChecked.running}天，继续加油',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}

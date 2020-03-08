import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_netbase/part2/view/TabCommon.dart';
import 'package:flutter_news_netbase/part2/content2/TabContentsPage.dart';

class HotPage extends StatefulWidget {
  @override
  _HotPageState createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  TabCommon tabCommon;

  @override
  void initState() {
//    tabCommon =TabCommon(hotTabsLabels, hotTabData
  }

  @override
  Widget build(BuildContext context) {
    tabCommon = TabCommon(hotTabsLabels, hotTabData,
        showContainer: true,
        containerBorderColor: Colors.red,
        key: ObjectKey(HotPage()),
        backgroundColor: Colors.white,
        isShowSearIcon: false,
        isScrollable: true,
        indicatorColor: Colors.white,
        indicatorWeight: 2.0,
        indicatorPadding: EdgeInsets.all(0),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.black,
        labelStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        unselectedLabelColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 14),
        dragStartBehavior: DragStartBehavior.start);

    return tabCommon;
  }
}

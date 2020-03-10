import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_news_netbase/part2/view/TabCommon.dart';
import 'package:flutter_news_netbase/part2/content2/TabContentsPage.dart';

class CirclePage extends StatefulWidget {
  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {

  TabCommon tabCommon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tabCommon = TabCommon(
        circleTabsLabels,
        circleTabData,
        showContainer: true,
        containerBorderColor: Colors.red,
        key: ObjectKey(CirclePage()),
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

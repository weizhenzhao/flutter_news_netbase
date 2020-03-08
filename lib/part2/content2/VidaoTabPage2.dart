import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_netbase/part2/TabContentsPage.dart';
import 'package:flutter_news_netbase/part2/SearchBar.dart';
import 'package:flutter_news_netbase/part2/routes/RouteManager.dart';
import 'package:flutter_news_netbase/part2/view/TabCommon.dart';

class VideoTabPage2 extends StatefulWidget {
  @override
  _VideoTabPage2State createState() => _VideoTabPage2State();
}

class _VideoTabPage2State extends State<VideoTabPage2>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  int result = 1;

  List<Tab> tabs = [];
  List<String> tabStrData = <String>[];
  List<Widget> tabWidgets = <Widget>[];
  Widget titleWidgets;

  TabCommon tabCommon;

  @override
  void initState() {
    super.initState();
    tabWidgets = videoTabData;
    tabStrData = videoTabsLabels;
    //tabCommon = TabCommon(tabStrData, tabWidgets, titleWidgets);
  }

  void onCancelSearch() {}

  void onSearchQueryChanged(String query) {}

  @override
  Widget build(BuildContext context) {
    setState(() {
      tabCommon = TabCommon(tabStrData, tabWidgets,
          isScrollable: true, key: ObjectKey(VideoTabPage2()));
    });

    return tabCommon;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_netbase/part2/TabContentsPage.dart';

class VideoTabPage extends StatefulWidget {
  @override
  _VideoTabPageState createState() => _VideoTabPageState();
}

class _VideoTabPageState extends State<VideoTabPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  int result = 1;

  List<Tab> tabs = [];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: videoTabData.length, vsync: this, initialIndex: 0);
    result = 1;

    tabs = videoTabsLabels.map((item) {
      return Tab(
        text: item,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      tabController.index = result;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TabBar(
          tabs: tabs,
          controller: tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 2.0,
          indicatorPadding: EdgeInsets.all(0),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.black,
          labelStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 14),
          dragStartBehavior: DragStartBehavior.start,
          onTap: (index) {
            print('点击了${index}');
          },
        ),
      ),
      body: TabBarView(
        children: videoTabData,
        controller: tabController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

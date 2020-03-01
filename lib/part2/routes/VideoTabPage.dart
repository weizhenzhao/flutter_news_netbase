import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_netbase/part2/TabContentsPage.dart';
import 'package:flutter_news_netbase/part2/SearchBar.dart';
import 'package:flutter_news_netbase/part2/routes/RouteManager.dart';

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

  void onCancelSearch() {}

  void onSearchQueryChanged(String query) {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    setState(() {
      tabController.index = result;
    });
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            width: width,
            height: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TabBar(
                    tabs: tabs,
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    indicatorWeight: 2.0,
                    indicatorPadding: EdgeInsets.all(0),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    unselectedLabelStyle:
                        TextStyle(color: Colors.black, fontSize: 14),
                    dragStartBehavior: DragStartBehavior.start,
                    onTap: (index) {
                      print('点击了 $index');
                    },
                  ),
                  flex: 9,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      routePathAnim(
                          context,
                          SearchBar(
                            Colors.white,
                            onCancelSearch: onCancelSearch,
                            onSearchQueryChanged: onSearchQueryChanged,
                          ),
                          showAnim: true,
                          type: Type.RIGHT_TO_LEFT,
                          duration: 800);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  flex: 1,
                )
              ],
            ),
          )
//
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

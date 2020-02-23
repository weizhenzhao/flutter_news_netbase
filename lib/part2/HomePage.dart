import 'package:flutter/material.dart';
import 'package:flutter_news_netbase/part2/content2/TabContentsPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_news_netbase/part2/SearchBar.dart';
import 'package:flutter_news_netbase/part2/routes/RouteManager.dart';

//首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int result = 0;

  TabController tabController;

  final List<Tab> tabs = <Tab>[
    Tab(
      text: '关注',
    ),
    Tab(text: '头条'),
    Tab(text: '视频'),
    Tab(text: '娱乐'),
    Tab(text: '体育'),
    Tab(text: '新时代'),
    Tab(text: '要闻'),
    Tab(text: '段子'),
    Tab(text: '知否'),
    Tab(text: '上海'),
    Tab(text: '公开课'),
    Tab(text: '圈子'),
    Tab(text: '财经'),
    Tab(text: '科技'),
    Tab(text: '汽车'),
    Tab(text: '网易号'),
    Tab(text: '军事'),
    Tab(text: '时尚'),
    Tab(text: '跟帖'),
    Tab(text: '直播'),
    Tab(text: '图片'),
    Tab(text: '小视频'),
    Tab(
      text: 'NBA',
    ),
    Tab(
      text: '热点',
    )
  ];

  @override
  Widget build(BuildContext context) {
    setState(() {
      tabController.index = result;
    });

    return Scaffold(
      appBar: buildTitleBar(),
      body: TabBarView(
        controller: tabController,
        children: data,
      ),
    );
  }

  Widget buildTitleBar() {
    return AppBar(
      //设置颜色
      backgroundColor: Colors.red,
      // 主题内容
      title: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          border: Border.all(color: Colors.redAccent, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        //margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.search,
              size: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  routePathAnim(
                      context,
                      SearchBar(
                        Colors.white, //状态栏的颜色
                        onCancelSearch: onCancelSearch,
                        onSearchQueryChanged: onSearchQueryChange,
                      ),
                      showAnim: true,
                      duration: 300,
                      type: Type.RIGHT_TO_LEFT);
//                  Navigator.of(context).push(
//                    PageRouteBuilder(
//                      pageBuilder: (BuildContext context,
//                          Animation<double> animation,
//                          Animation<double> secondaryAnimation) {
//                        return SearchBar(
//                          Colors.white, //状态栏的颜色
//                          onCancelSearch: onCancelSearch,
//                          onSearchQueryChanged: onSearchQueryChange,
//                        );
//                      },
//                      transitionsBuilder: (BuildContext context,
//                          Animation<double> animation,
//                          Animation<double> secondaryAnimation,
//                          Widget child) {
//                        return SlideTransition(
//                          position: Tween(
//                              begin: Offset(1.0, 0.0),
//                              end: Offset(0.0, 0.0))
//                              .animate(animation),
//                          child: child,
//                        );
//                      },
//                      transitionDuration: Duration(milliseconds: 300),
//                    ),
//                  );
                },
                child: Text(
                  '最新劲爆新闻实时推送',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
      //右侧
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/hot');
            },
            child: Icon(
              Icons.whatshot,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/notice');
            },
            child: Icon(
              Icons.chat,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: InkWell(
            onTap: () {
              pushData(context).then((data) {
                result = data;
              });
            },
            child: Icon(
              Icons.format_list_bulleted,
              size: 20,
            ),
          ),
        )
      ],

      bottom: TabBar(
//        Key key,
//        @required this.tabs,
//      this.controller,
//      this.isScrollable = false,
//      this.indicatorColor,
//      this.indicatorWeight = 2.0,
//      this.indicatorPadding = EdgeInsets.zero,
//      this.indicator,
//      this.indicatorSize,
//      this.labelColor,
//      this.labelStyle,
//      this.labelPadding,
//      this.unselectedLabelColor,
//      this.unselectedLabelStyle,
//      this.dragStartBehavior = DragStartBehavior.start,
//      this.onTap,

        tabs: tabs,
        controller: tabController,
        isScrollable: true,
        //表示是否可以滑动

        indicatorColor: Colors.white,
        //下划线的颜色
        indicatorWeight: 2.0,
        //下划线的粗细
        indicatorPadding: EdgeInsets.all(10),
        //下划线的内边距

        indicatorSize: TabBarIndicatorSize.tab,
        //紧跟着文字

        labelColor: Colors.white,
        //文字的颜色
        labelStyle: TextStyle(color: Colors.white, fontSize: 20),
        labelPadding: EdgeInsets.all(5.0),
        //文字的内边距

        unselectedLabelColor: Colors.yellow,
        //未选中时的颜色
        unselectedLabelStyle: TextStyle(color: Colors.green, fontSize: 18),
        onTap: (index) {
          print('点击了$index');
        },
      ),
    );
  }

  Future<int> pushData(BuildContext context) async {
    var data = await Navigator.of(context).pushNamed('/all_items');
    return data;
  }

  void onCancelSearch() {}

  void onSearchQueryChange(String data) {}

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: tabs.length, vsync: this);

    super.initState();
    result = 0;
  }
}

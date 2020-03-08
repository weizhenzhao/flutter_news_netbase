import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_netbase/part2/RecentPage.dart';
import 'package:flutter_news_netbase/part2/HomePage.dart';
import 'package:flutter_news_netbase/part1/LevelPage.dart';
import 'package:flutter_news_netbase/part1/Settings.dart';
import 'package:flutter_news_netbase/part1/SmallVideoPage.dart';
import 'package:flutter_news_netbase/part1/SquarePage.dart';
import 'package:flutter_news_netbase/part1/FreeNewsPage.dart';
import 'package:flutter_news_netbase/part2/AIItemsPage.dart';
import 'package:flutter_news_netbase/part2/DrawerPage.dart';
import 'package:flutter_news_netbase/part2/SearchBar.dart';
//import 'package:flutter_news_netbase/part1/HotPage.dart';
import 'package:flutter_news_netbase/part1/NoticePage.dart';
import 'package:flutter_news_netbase/part2/routes/VideoTabPage.dart';
import 'package:flutter_news_netbase/part2/content2/VidaoTabPage2.dart';
import 'package:flutter_news_netbase/part2/content2/HotPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //设置全局状态栏颜色  红色
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.red));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/recent': (BuildContext context) => RecentPage(),
//        '/level': (BuildContext context) => LevelPage(),
//        '/settings': (BuildContext context) => AccountSettingPage(),
//        '/video': (BuildContext context) => SmallVideoPage(),
//        '/square': (BuildContext context) => SquarePage(),
//        '/freeflow_news': (BuildContext context) => FreeNewsPage(),
        '/all_items': (BuildContext context) => AIItemsPage(),
        '/hot': (BuildContext context) => HotPage(),
        '/notice': (BuildContext context) => NoticePage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int initPage = 0;

  PageController pageController;

  @override
  void initState() {
    // this 表示当前继承的 SingleTickerProviderStateMixin 的当前这个类
    pageController = PageController(initialPage: initPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: buildTitleBar(),

      body: PageView(
        controller: pageController,
//        physics: NeverScrollableScrollPhysics(), //禁止滑动
        onPageChanged: (int index) {
          print('当前点击的页面是:${index}');
          setState(() {
            initPage = index;
          });
        },
        children: <Widget>[
          HomePage(),
          //SmallVideoPage(),
          VideoTabPage2(),
          //HotPage(),
          HotPage(),
          NoticePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          pageController.jumpToPage(index);
        },

        items: [
          BottomNavigationBarItem(
              title: Text('首页'),
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text('视频'),
              icon: Icon(
                Icons.live_tv,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text('圈子'),
              icon: Icon(
                Icons.whatshot,
                color: Colors.grey,
              )),
          BottomNavigationBarItem(
              title: Text('热度'),
              icon: Icon(
                Icons.recent_actors,
                color: Colors.grey,
              )),
        ],

        currentIndex: initPage,
        //当前选中的,修改成当前索引
        elevation: 10,
        //阴影
        type: BottomNavigationBarType.fixed,
        //白色的底
//        fixedColor: Colors.red,//选中的颜色
        backgroundColor: Colors.white,
        //背景颜色

        //icon的大小
        iconSize: 25,

        selectedItemColor: Colors.blue,
        //选中时的item颜色，不能喝fixedColor一起使用
        //type: BottomNavigationBarType.shifting,//正好反过来

        selectedIconTheme: IconThemeData(size: 20),
        //选中标签的大小，以IconThemeData为准

        selectedFontSize: 10, //选中标签的文字大小
      ),
      drawer: DrawerPage(),
      drawerDragStartBehavior: DragStartBehavior.start,
      //滑动开始的坐标
      drawerEdgeDragWidth: 50, //从左到右滑动，默认padding为20

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_news_netbase/part2/TabContentsPage.dart';
import 'package:flutter_news_netbase/part2/SearchBar.dart';
import 'package:flutter_news_netbase/part2/routes/RouteManager.dart';

class TabCommon extends StatefulWidget {
  TabController _tabController;

  int _result = 1;

  List<Tab> _tabs = [];

  List<String> tabStrData = <String>[];

  List<Widget> tabWidgets = <Widget>[];

//  Widget titleWidgets;

  Color indicatorColor;

  double indicatorWeight = 2;

  EdgeInsets indicatorPadding;

  TabBarIndicatorSize indicatorSize;

  Color labelColor;

  TextStyle labelStyle;

  Color unselectedLabelColor;

  DragStartBehavior dragStartBehavior;

  TextStyle unselectedLabelStyle;

  Color backgroundColor;

  bool isShowSearIcon;

  double widths;

  bool showContainer;

  Color containerBorderColor;

  bool isScrollable = true;

  TabCommon(
    this.tabStrData,
    this.tabWidgets, {
    this.backgroundColor,
    this.isShowSearIcon,
    this.indicatorColor,
    this.indicatorWeight,
    this.indicatorPadding,
    this.indicatorSize,
    this.labelColor,
    this.labelStyle,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.dragStartBehavior,
    Key key,
    this.showContainer = false,
    this.containerBorderColor,
    this.isScrollable,
  }) : super(key: key);

  @override
  _TabCommonState createState() => _TabCommonState();
}

// 通用的一个Tab页面，Tab页面的基类
class _TabCommonState extends State<TabCommon>
    with SingleTickerProviderStateMixin {
  Tab currentTab;

  @override
  void initState() {
    super.initState();
    widget._tabController = TabController(
        length: widget.tabWidgets.length,
        vsync: this,
        initialIndex: widget._result);
    widget._tabs = widget.tabStrData.map((item) {
      if (widget.showContainer == true) {
        return Tab(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: new BoxDecoration(
              border: new Border.all(
                color: widget.containerBorderColor == null
                    ? Colors.grey
                    : widget.containerBorderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Text(item),
          ),
        );
      } else {
        currentTab = Tab(
          text: item,
        );
        return currentTab;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    widget.widths = MediaQuery.of(context).size.width;

    setState(() {
      widget._tabController.index = widget._result;
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: buildCommonTitle(tabs: widget._tabs, isShowSearIcon: true),
      ),
      body: TabBarView(
        children: widget.tabWidgets == null
            ? buildCommonTitle(tabs: widget._tabs, isShowSearIcon: true)
            : widget.tabWidgets,
        controller: widget._tabController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget._tabController.dispose();
  }

  @override
  onSearchQueryChanged(String query) {
    print('点击 search $query');
  }

  onCancelSearch() {
    onSearchQueryChanged('');
    Navigator.of(context).pop();
  }

  Widget buildTabBar(List<Tab> tabs) {
    return TabBar(
      key: PageStorageKey<Tab>(currentTab),
      tabs: tabs,
      controller: widget._tabController,
      isScrollable: widget.isScrollable,
      indicatorColor:
          widget.indicatorColor == null ? Colors.black : widget.indicatorColor,
      indicatorWeight:
          widget.indicatorWeight == null ? 2.0 : widget.indicatorWeight,
      indicatorPadding: widget.indicatorPadding == null
          ? EdgeInsets.all(0)
          : widget.indicatorPadding,
      indicatorSize: widget.indicatorSize == null
          ? TabBarIndicatorSize.tab
          : widget.indicatorSize,
      labelColor: widget.labelColor == null ? Colors.black : widget.labelColor,
      labelStyle: widget.labelStyle == null
          ? TextStyle(color: Colors.black, fontSize: 14)
          : widget.labelStyle,
      unselectedLabelStyle: widget.unselectedLabelStyle == null
          ? TextStyle(color: Colors.orange, fontSize: 14)
          : widget.unselectedLabelStyle,
      dragStartBehavior: widget.dragStartBehavior == null
          ? DragStartBehavior.start
          : widget.dragStartBehavior,
      onTap: (index) {
        print('点击了 $index');
      },
    );
  }

  Widget buildCommonTitle({
    Key key,
    @required List<Widget> tabs,
    bool isShowSearIcon = false,
    TabController controller,
    bool isScrollable = true,
    Color indicatorColor,
    double indicatorWeight = 2.0,
    EdgeInsetsGeometry indicatorPadding = EdgeInsets.zero,
    Decoration indicator,
    TabBarIndicatorSize indicatorSize,
    Color labelColor,
    TextStyle labelStyle,
    EdgeInsetsGeometry labelPadding,
    Color unselectedLabelColor,
    TextStyle unselectedLabelStyle,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ValueChanged<int> onTap,
  }) {
    if (isShowSearIcon == true) {
      return Container(
        width: widget.widths,
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: buildTabBar(widget._tabs),
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
      );
    } else {
      buildTabBar(widget._tabs);
    }
  }
}

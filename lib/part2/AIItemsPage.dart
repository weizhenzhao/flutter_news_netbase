import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class AIItemsPage extends StatefulWidget {
  @override
  _AIItemsPageState createState() => _AIItemsPageState();
}

class _AIItemsPageState extends State<AIItemsPage> {
  List<String> datas = [
    '关注',
    '头条',
    '视频',
    '娱乐',
    '体育',
    '新时代',
    '要闻',
    '段子',
    '知否',
    '上海',
    '公开课',
    '圈子',
    '财经',
    '科技',
    '汽车',
    '网易号',
    '军事',
    '时尚',
    '跟帖',
    '直播',
    '图片',
    '小视频',
    'NBA',
    '热点',
    '房产',
    '股票',
    '轻松一刻',
    '历史',
    '家居',
    '播单',
    '独家',
    '游戏',
    '健康',
    '航空',
    '小说',
    '热度'
  ];

  @override
  void initState() {
    super.initState();
    _tiles = [
      buildItems('关注'),
      buildItems('头条'),
      buildItems('视频'),
      buildItems('娱乐'),
      buildItems('体育'),
      buildItems('新时代'),
      buildItems('要闻'),
      buildItems('段子'),
      buildItems('知否'),
      buildItems('上海'),
      buildItems('公开课'),
      buildItems('圈子'),
      buildItems('财经'),
      buildItems('科技'),
      buildItems('汽车'),
      buildItems('网易号'),
      buildItems('军事'),
      buildItems('时尚'),
      buildItems('跟帖'),
      buildItems('直播'),
      buildItems('图片'),
      buildItems('小视频'),
      buildItems('NBA'),
      buildItems('热点'),
      buildItems('房产'),
      buildItems('股票'),
      buildItems('轻松一刻'),
      buildItems('历史'),
      buildItems('家居'),
      buildItems('播单'),
      buildItems('独家'),
      buildItems('游戏'),
      buildItems('健康'),
      buildItems('航空'),
      buildItems('小说'),
      buildItems('热度'),
    ];
  }

  List<Widget> _tiles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          '所有栏目',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(),
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop(0);
            },
          )
        ],
      ),
      body: buildContents(),
    );
  }

  Widget buildContents() {
    return ListView(
      children: <Widget>[
        Container(
          width: 400,
          height: 50,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                    child: Text(
                      '我的栏目',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                    child: Text(
                      '拖动排序',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: Center(
                    child: Text(
                      '完成',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        buildContentsAll(),
        RaisedButton(
          child: Text(
            '新增',
          ),
          color: Colors.blue,
          onPressed: () {
            setState(() {
              Random random = Random();
              int index = random.nextInt(datas.length);
              var newItem = buildItems(datas[index]);
              _tiles.add(newItem);
            });
          },
        ),
        RaisedButton(
          child: Text(
            '删除',
          ),
          color: Colors.blue,
          onPressed: () {
            setState(() {
              _tiles.removeAt(datas.length - 1);
            });
          },
        )
      ],
    );
  }

  Widget buildContentsAll() {
    return ReorderableWrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 3.0,
        //水平方向间距
        runSpacing: 4.0,
        //垂直方向间距
        padding: EdgeInsets.all(5),
        //内边距
        children: _tiles,
        onReorder: onReorder,
        onNoReorder: (index) {
          //this callback is optional
          print('滑动结束时位置的索引:$index');
        },
        onReorderStarted: (index) {
          //this callback is optional
          print('滑动开始时位置的索引:$index');
        });
  }

  void onReorder(int oldIndex, int newIndex) {
    //删除旧位置的索引
    Widget data = _tiles.removeAt(oldIndex);
    //插入新位置的widget
    _tiles.insert(newIndex, data);
    print('滑动过程中，旧位置的索引:$oldIndex,新位置的索引$newIndex');
  }

  Widget buildItems(String data) {
    return GestureDetector(
      onTap: () {
        print('点击了item ${datas.indexOf(data)}');
        Navigator.of(context).pop(datas.indexOf(data));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(1, 1, 0, 0),
        width: 70,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              Icons.close,
              color: Colors.grey[400],
              size: 14,
            ),
            Text(
              data,
              style: TextStyle(
                color: data == '头条' ? Colors.red : Colors.black,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }

//  Widget buildContents() {
//    double width = MediaQuery.of(context).size.width;
//
//    List<String> datas = [
//      '关注',
//      '头条',
//      '视频',
//      '娱乐',
//      '体育',
//      '新时代',
//      '要闻',
//      '段子',
//      '知否',
//      '上海',
//      '公开课',
//      '圈子',
//      '财经',
//      '科技',
//      '汽车',
//      '网易号',
//      '军事',
//      '时尚',
//      '跟帖',
//      '直播',
//      '图片',
//      '小视频',
//      'NBA',
//      '热点',
//      '房产',
//      '股票',
//      '轻松一刻',
//      '历史',
//      '家居',
//      '播单',
//      '独家',
//      '游戏',
//      '健康',
//      '航空',
//      '小说',
//      '热度'
//    ];
//
//    return SizedBox(
//      width: width,
//      child: Wrap(
//        spacing: 10.0,
//        runSpacing: 10.0,
//        direction: Axis.horizontal,
//        verticalDirection: VerticalDirection.down,
//        alignment: WrapAlignment.spaceEvenly,
//        crossAxisAlignment: WrapCrossAlignment.start,
//        children: datas.map((data) {
//          return Chip(
//            label: Container(
//              child: Center(
//                child: Text(data),
//              ),
//              width: 55,
//            ),
//            labelStyle: TextStyle(
//              color: data == '头条' ? Colors.red : Colors.black87,
//              fontSize: 13,
//            ),
//            backgroundColor: Colors.white,
//            shape: RoundedRectangleBorder(
//              side: BorderSide(
//                color: Colors.grey[200],
//                width: 1.0,
//                style: BorderStyle.solid,
//              ),
//              borderRadius: BorderRadius.circular(20),
//            ),
//          );
//        }).toList(),
//      ),
//    );
//  }
}

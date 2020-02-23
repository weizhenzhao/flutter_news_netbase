import 'package:flutter/material.dart';

class AIItemsPage extends StatefulWidget {
  @override
  _AIItemsPageState createState() => _AIItemsPageState();
}

class _AIItemsPageState extends State<AIItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('所有栏目'),
      ),
      body: buildContents(),
    );
  }

  Widget buildContents(){

    double width = MediaQuery.of(context).size.width;

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



    return SizedBox(
      width: width,
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        direction: Axis.horizontal,
        verticalDirection: VerticalDirection.down,
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: datas.map((data){
          return Chip(
            label: Container(
              child: Center(child: Text(data),),
              width: 55,
            ),
            labelStyle: TextStyle(
              color: data=='头条'?Colors.red:Colors.black87,
              fontSize: 13,
            ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey[200],
                width: 1.0,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        }).toList(),
      ),
    );
  }

}

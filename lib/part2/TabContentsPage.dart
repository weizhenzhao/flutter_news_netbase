import 'package:flutter_news_netbase/part1/SmallVideoPage.dart';
import 'package:flutter_news_netbase/part2/RecentPage.dart';
import 'package:flutter/material.dart';

List<Widget> data=[
  RecentPage(),
//  Center(child: Text('关注'),),
  Center(child: Text('头条'),),
  Center(child: Text('视频'),),
  Center(child: Text('娱乐'),),
  Center(child: Text('体育'),),
  Center(child:Text('新时代'),),
  Center(child: Text('要闻'),),
  Center(child: Text('段子'),),
  Center(child: Text('知否'),),
  Center(child: Text('上海'),),
  Center(child: Text('公开课'),),
  Center(child: Text('圈子'),),
  Center(child: Text('财经'),),
  Center(child: Text('科技'),),
  Center(child: Text('汽车'),),
  Center(child: Text('网易号'),),
  Center(child: Text('军事'),),
  Center(child: Text('时尚'),),
  Center(child: Text('跟帖'),),
  Center(child: Text('直播'),),
  Center(child: Text('图片'),),
  Center(child: Text('小视频'),),
  Center(child: Text('NBA'),),
  Center(child: Text('热点'),),
];

List<Widget> videoTabData = [

  Center(child: Text('推荐'),),
  SmallVideoPage(),
  Center(child: Text('榜单'),),
  Center(child: Text('超级IP'),),
  Center(child: Text('新衣人'),),
  Center(child: Text('百年影像'),),
  Center(child: Text('播单'),),
  Center(child: Text('搞笑'),),
  Center(child: Text('影视'),),
  Center(child: Text('综艺'),),
  Center(child: Text('音乐'),),
  Center(child: Text('现场'),),

  Center(child: Text('黑科技'),),
  Center(child: Text('小品'),),
  Center(child: Text('萌宠'),),
  Center(child: Text('军武'),),
  Center(child: Text('猎奇'),),
  Center(child: Text('二次元'),),
];


List<String> videoTabsLabels=[
  '推荐',
  '小视频',
  '榜单',
  '超级IP',
  '新衣人',
  '百年影像',
  '播单',
  '搞笑',
  '影视',
  '综艺',
  '音乐',
  '现场',
  '黑科技',
  '小品',
  '萌宠',
  '军武',
  '猎奇',
  '二次元'

];

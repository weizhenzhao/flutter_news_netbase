import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_news_netbase/part2/model/SmallVideoModel.dart';
import 'package:flutter_news_netbase/part2/routes/RouteManager.dart';
import 'package:flutter_news_netbase/part2/content2/SmallVideoListPage.dart';
import 'package:video_player/video_player.dart';

class SmallVideoPage extends StatefulWidget {
  //增加一个key
  SmallVideoPage({Key key}) : super(key: key);

  @override
  _SmallVideoPageState createState() => _SmallVideoPageState();
}

class _SmallVideoPageState extends State<SmallVideoPage> {
  List<Data> datas2;

  @override
  void initState() {
    super.initState();
    datas2 = <Data>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
//      appBar: new AppBar(
//        title: new Text('小视频'),
//      ),
      body: buildContexts(context),
    );
  }

  Widget buildGridView(BuildContext context, List<Data> datas) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 6,
      mainAxisSpacing: 3,
      childAspectRatio: 9.0 / 16.0,
      children: datas.map((data) {
        return VideoItem(data: data, key: widget.key);
      }).toList(),
    );
  }

//  Widget buildVideoItems(BuildContext context, Data data) {
//    String counts = data.viewCounts;
//    int intData = int.parse(counts);
//    String results = "";
//    if (intData >= 10000) {
//      double newData = intData / 10000;
//      results = "${newData.toStringAsFixed(1)}万";
//    } else {
//      results = counts;
//    }
//
//    return GestureDetector(
//      onTap: () {
//        gotoNewPage(context, SmallVideoListPage());
//      },
//      child: Container(
//        width: 180,
//        height: 100,
//        child: Stack(
//          children: <Widget>[
//            VideoPage(data),
//            Positioned(
//              bottom: 20,
//              left: 0,
//              right: 0,
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
//                    child: Text(
//                      '${data.title}',
//                      //最多只能有2行显示
//                      maxLines: 2,
//                      //超出部分省略号
//                      overflow: TextOverflow.ellipsis,
//                      style: TextStyle(fontSize: 17, color: Colors.white),
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        Text(
//                          '$results次包房量',
//                          style: TextStyle(fontSize: 13, color: Colors.grey),
//                        ),
//                        Text(
//                          '${data.votecount}人点赞',
//                          style: TextStyle(fontSize: 13, color: Colors.grey),
//                        ),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }

  Widget buildContexts(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: rootBundle.loadString('assets/video.json'),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          SmallVideoModel model = videoModuleFromJson(snap.data);
          for (int i = 0; i < model.data.length; i++) {
            Data bean = model.data[i];
            datas2.add(bean);
          }
          return buildGridView(context, datas2);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}


class VideoItem extends StatefulWidget {
  Data data;

  VideoItem({
    Key key,
    @required this.data,
  })  : assert(data != null),
        super(key: key);

  @override
  VideoItemState createState() => VideoItemState();
}

class VideoItemState extends State<VideoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //进入视频详情页
        gotoNewPage(context, SmallVideoListPage(widget.data));
      },
      child: GridTile(
        //文字描述部分位于底部
        footer: GridTileBar(
          backgroundColor: Colors.transparent,
          title: buildTitleText(widget.data, isSubTitle: false),
          subtitle: buildTitleText(widget.data, isSubTitle: true),
        ),
        child: VideoPlayerThumbPage(widget.data),
      ),
    );
  }

  ///构建描述视频文本标题
  buildTitleText(Data data, {bool isSubTitle = false}) {
    String counts = data.viewCounts;
    int intData = int.parse(counts);
    String results = "";
    if (intData >= 10000) {
      double newData = intData / 10000;
      results = "${newData.toStringAsFixed(1)}万";
    } else {
      results = counts;
    }
  }
}

//视频播放页面修改一下，普通视频加载页面
//实际开发中，没有必要在这里进行加载视频操作
//获取到视频缩略图，让它显示出来即可
//接口里会有一个thumb之内的字段表示视频缩略图
//点进详情页才加载视频

class VideoPlayerThumbPage extends StatefulWidget {
  final Data data;

  VideoPlayerThumbPage(this.data);

  @override
  _VideoPlayerThumbPageState createState() => _VideoPlayerThumbPageState();
}

class _VideoPlayerThumbPageState extends State<VideoPlayerThumbPage> {
  bool _initialized;
  VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.data.url);
    controller.initialize();
    _initialized = controller.value.initialized;
    controller.addListener(() {
//      if (!mounted) {
//        return;
//      }
      final bool controllerInitialized = controller.value.initialized;
      if (_initialized != controllerInitialized) {
        setState(() {
          _initialized = controllerInitialized;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 2;
    return SizedBox(
      width: width,
      height: 330,
      child: _initialized
          ? VideoPlayer(controller)
          : Container(width: width, height: 330, color: Colors.teal),
    );
  }
}

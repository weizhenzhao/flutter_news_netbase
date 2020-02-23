import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news_netbase/part2/model/SmallVideoModel.dart';
import 'package:flutter_news_netbase/part2/routes/RouteManager.dart';
import 'package:video_player/video_player.dart';


class SmallVideoPage extends StatefulWidget {
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
      childAspectRatio: 9.0 / 16.0,
      children: datas.map((data) {
        return buildVideoItems(context, data);
      }).toList(),
    );
  }

  Widget buildVideoItems(BuildContext context, Data data) {
    String counts = data.viewCounts;
    int intData = int.parse(counts);
    String results = "";
    if (intData >= 10000) {
      double newData = intData / 10000;
      results = "${newData.toStringAsFixed(1)}万";
    } else {
      results = counts;
    }

    return GestureDetector(
      onTap: () {
        print('进入详情页面');
      },
      child: Container(
        width: 180,
        height: 100,
        child: Stack(
          children: <Widget>[

            VideoPage(data),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Text(
                      '${data.title}',
                      //最多只能有2行显示
                      maxLines: 2,
                      //超出部分省略号
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('$results次包房量',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                        Text('${data.votecount}人点赞',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),

                      ],
                    ),
                  ),


                ],
              ),
            )


          ],
        ),
      ),
    );
  }


  Widget buildContexts(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
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

class VideoPage extends StatefulWidget {
  Data data;

  VideoPage(this.data);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController controller;
  bool inits = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
//        if (controller.value.isPlaying) {
//          controller.pause();
//        } else {
//          controller.play();
//        }
//        gotoNewPage(context, SmallVideoListPage(widget.data));
      },
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 300,
            height: 300,
            child: inits
                ? VideoPlayer(controller)
                : Container(
              width: 300,
              height: 300,
              color: Colors.teal,
            ),
          ),
          Visibility(
            visible: !inits,
            child: Container(
              height: 5,
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                    playedColor: Colors.red[400],
                    bufferedColor: Colors.white,
                    backgroundColor: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    controller = VideoPlayerController.network(widget.data.url);
    controller.initialize();
    controller.setVolume(1.0); //音量
    controller.addListener(() {
      //获取controller里面的值
      print(controller.value);
      if (inits != controller.value.initialized) {
        inits = controller.value.initialized;
        setState(() {});
      }

      //如果出现错误 输出错误
      if (controller.value.hasError) {
        print(controller.value.errorDescription);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

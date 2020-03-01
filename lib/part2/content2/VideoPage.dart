import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_news_netbase/part2/gestures/GestureUtil.dart';

//视频播放器类
class VideoPage extends StatefulWidget {
  String dataSource;

  VideoPage(this.dataSource);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController controller;
  bool inits = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return buildGesture(
      () {
        if (controller.value.isPlaying) {
          controller.pause();
        } else {
          controller.play();
        }
      },
//      Column(
//        children: <Widget>[
//          SizedBox(
//            width: width,
//            height: height - 5,
//            child: inits
//                ? VideoPlayer(controller)
//                : Container(
//                    width: width,
//                    height: 330,
//                    color: Colors.teal,
//                  ),
//          ),
//          Visibility(
//            visible: !inits,
//            child: Container(
//              height: 5,
//              child: VideoProgressIndicator(
//                controller,
//                allowScrubbing: true,
//                colors: VideoProgressColors(
//                    playedColor: Colors.red[400],
//                    bufferedColor: Colors.white,
//                    backgroundColor: Colors.grey),
//              ),
//            ),
//          )
//        ],
//      ),
      Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: width,
              height: height,
              child: inits
                  ? VideoPlayer(controller)
                  : Container(
                      width: width,
                      height: height,
                      color: Colors.teal,
                    ),
            ),
          ),
          // 进度条
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                    playedColor: Colors.red[400],
                    bufferedColor: Colors.white,
                    backgroundColor: Colors.grey),
              )),
        ],
      ),
    );
  }

  @override
  void initState() {
    controller = VideoPlayerController.network(widget.dataSource);
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
    // 循环播放
    controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

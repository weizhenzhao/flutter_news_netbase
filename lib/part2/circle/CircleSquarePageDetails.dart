import 'package:flutter/material.dart';
import 'package:flutter_news_netbase/part2/model/CircleSquareModel.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CircleSquarePageDetails extends StatefulWidget {
  Data data;

  CircleSquarePageDetails(this.data);

  @override
  CircleSquarePageDetailsState createState() =>
      new CircleSquarePageDetailsState();
}

class CircleSquarePageDetailsState extends State<CircleSquarePageDetails> {
  FlutterWebviewPlugin flutterWebViewPlugin;

  //  String urls = 'https://www.baidu.com';

  // ignore: prefer_collection_literals
  final Set<JavascriptChannel> jsChannels = [
    JavascriptChannel(
        name: 'Print',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        }),
  ].toSet();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin = FlutterWebviewPlugin();
  }

  @override
  Widget build(BuildContext context) {
    //    return new Scaffold(
    //      appBar: new AppBar(
    //        title: new Text('实时热榜详情页'),
    //      ),
    //    );

    double width = MediaQuery.of(context).size.width;

    flutterWebViewPlugin.onScrollYChanged.listen((double y) {
      if (mounted) {
        setState(() {
          print('Y轴滑动的距离是:  $y');
        });
      }
    });

    flutterWebViewPlugin.onProgressChanged.listen((double progress) {
      if (mounted) {
        setState(() {
          print('当前网页加载进度是:  $progress');
        });
      }
    });

    Contents contents;

    for (int j = 0; j < widget.data.contents.length; j++) {
      contents = widget.data.contents[j];
    }

    return WebviewScaffold(
      url: contents.url,
      //      javascriptChannels: jsChannels,
      //      mediaPlaybackRequiresUserGesture: false,
      withZoom: true,
      withLocalStorage: true,
      hidden: false,
      //      userAgent:
      //          'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Mobile Safari/537.36',
      initialChild: Container(
        width: width,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text('正在玩命加载中...'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    flutterWebViewPlugin.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

//专场动画的自定义 时长，动画类型都可以自定义
void routePathAnim(BuildContext context, Widget newPage,
    {bool showAnim = false,
    Type type = Type.RIGHT_TO_LEFT,
    int duration = 100}) {
  if (showAnim) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return newPage;
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          double dx = 1.0;
          double dy = 0.0;

          double endX = 0.0;
          double endY = 0.0;
          switch (type) {
            case Type.BOTTOM_TO_TOP:
              dx = 0.0;
              dy = 1.0;
              endX = 0.0;
              endY = 0.0;
              break;
            case Type.LEFT_TO_RIGHT:
              dx = 0.0;
              dy = 0.0;
              endX = 0.0;
              endY = 1.0;
              break;
            case Type.RIGHT_TO_LEFT:
              dx = 1.0;
              dy = 0.0;
              endX = 0.0;
              endY = 0.0;
              break;
            case Type.TOP_TO_BOTTOM:
              dx = 0.0;
              dy = 0.0;
              endX = 0.0;
              endY = 1.0;
              break;
          }

          return SlideTransition(
            position: Tween(begin: Offset(dx, dy), end: Offset(endX, endY))
                .animate(animation),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: duration),
      ),
    );
  } else {
    //去掉路由动画
    Navigator.of(context)
        .push(PageRouteBuilder(pageBuilder: (_, __, ___) => newPage));
  }
}

enum Type {
  //从下到上
  BOTTOM_TO_TOP,

  //从上到下
  TOP_TO_BOTTOM,

  //从右到左
  RIGHT_TO_LEFT,

  //从左到右
  LEFT_TO_RIGHT,
}

//普通路由跳转
void gotoNewPage(BuildContext context, Widget newPage) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return newPage;
      },
    ),
  );
}

//命名路由
void gotoNewPage2(BuildContext context, String routeName) {
  Navigator.of(context).pushNamed(routeName);
}

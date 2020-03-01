import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureUtil extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    //    super.rejectGesture(pointer);
    acceptGesture(pointer);
  }
}

// 创建手势识别器（能够决事件冲突的手势识别器）不是GestureDetector
Widget buildGesture(GestureTapCallback onTap, Widget child) {
  return RawGestureDetector(
    gestures: {
      GestureUtil: GestureRecognizerFactoryWithHandlers<GestureUtil>(
            () => GestureUtil(),
            (GestureUtil instance) {
          instance.onTap = onTap;
        },
      ),
    },
    behavior: HitTestBehavior.opaque,
    child: child,
  );
}

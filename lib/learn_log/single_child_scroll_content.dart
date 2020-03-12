import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SingleChildScrollContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      //reverse: true,
      padding: EdgeInsets.all(8),
      // primary: false,
      // physics: ScrollPhysics(),
      // controller: ScrollController(),
      dragStartBehavior: DragStartBehavior.start,
      child: Center(
        child: Column(
          //动态创建一个List<Widget>
          children: str
              .split("")
              //每一个字母都用一个Text显示,字体为原来的两倍
              .map((c) => Text(
                    c,
                    textScaleFactor: 2.0,
                  ))
              .toList(),
        ),
      ),
    ));
  }
}

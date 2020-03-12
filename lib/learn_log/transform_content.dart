import 'package:flutter/material.dart';
import 'dart:math' as math;

// Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。
class TransformContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.vertical,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 64,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
          ),
          Container(
            color: Colors.black,
            child: Transform(
              alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
              transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            //默认原点为左上角，左移20像素，向上平移5像素
            child: Transform.translate(
              offset: Offset(-20.0, -5.0),
              child: Text("Hello world"),
            ),
          ),
          DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(
                  scale: 1.5, //放大到1.5倍
                  child: Text("Hello world"))),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.rotate(
              //旋转90度
              angle: math.pi / 2,
              child: Text("Hello world"),
            ),
          ),
          // RotatedBox是作用于layout阶段，所以子组件会旋转90度（而不只是绘制的内容），decoration会作用到子组件所占用的实际空间上
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            //将Transform.rotate换成RotatedBox
            child: RotatedBox(
              quarterTurns: 1, //旋转90度(1/4圈)
              child: Text("Hello world"),
            ),
          ),
        ]);
  }
}

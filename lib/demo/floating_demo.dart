import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FloatingDemo extends StatelessWidget {
  const FloatingDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 300,
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              children: [
                Container(
                  height: double.infinity,
                  color: Colors.green,
                ),
                Positioned(
                  height: 100,
                  left: 10,
                  right: 10,
                  top: -50,
                  child: Container(
                    //设置 child 居中
                    alignment: Alignment(0, 0),
                    height: 100,
                    width: 300,
                    //边框设置
                    decoration: new BoxDecoration(
                      //背景
                      color: Colors.white,
                      //设置四周圆角 角度
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      //设置四周边框
                      //border: new Border.all(width: 1, color: Colors.red),
                    ),
                    //child: Text("Container 的圆角边框"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ScrollControllerContent extends StatefulWidget {
  @override
  _ScrollControllerContentState createState() =>
      _ScrollControllerContentState();
}

class _ScrollControllerContentState extends State<ScrollControllerContent> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  String _progress = "0%"; //保存进度百分比

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 100 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 100 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Container(
            color: Colors.cyanAccent,
            margin: EdgeInsets.all(4),
            child: Scrollbar(
              //进度条
              // 监听滚动通知
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  double progress = notification.metrics.pixels /
                      notification.metrics.maxScrollExtent;
                  //重新构建
                  setState(() {
                    _progress = "${(progress * 100).toInt()}%";
                  });
                  print("BottomEdge: ${notification.metrics.extentAfter == 0}");
                  return false; // true 放开此行注释后，进度条将失效
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ListView.builder(
                        itemCount: 100,
                        itemExtent: 50.0,
                        itemBuilder: (context, index) {
                          return ListTile(title: Text("$index"));
                        }),
                    CircleAvatar(
                      //显示进度百分比
                      radius: 30.0,
                      child: Text(_progress),
                      backgroundColor: Colors.black54,
                    )
                  ],
                ),
              ),
            )),
      ),
      Expanded(
          child: Container(
              color: Colors.cyanAccent,
              margin: EdgeInsets.all(4),
              child: Stack(children: [
                Positioned(
                  child: Scrollbar(
                    child: ListView.builder(
                        itemCount: 100,
                        itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
                        controller: _controller,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("$index"),
                          );
                        }),
                  ),
                ),
                Positioned(
                  right: 48.0,
                  bottom: 48.0,
                  width: 48,
                  height: 48,
                  child: !showToTopBtn
                      ? Container()
                      : IconButton(
                          icon: Icon(Icons.arrow_upward),
                          onPressed: () {
                            //返回到顶部时执行动画
                            _controller.animateTo(.0,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.ease);
                          }),
                ),
              ])))
    ]);
  }
}

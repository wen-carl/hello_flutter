import 'package:flutter/material.dart';

class ListViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Container(
              color: Colors.blueAccent,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.all(4),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(16.0),
                children: <Widget>[
                  const Text(
                    'I\'m dedicating every day to you',
                    textScaleFactor: 2,
                  ),
                  const Text(
                    'Domestic life was never quite my style',
                    textScaleFactor: 2,
                  ),
                  const Text(
                    'When you smile, you knock me out, I fall apart',
                    textScaleFactor: 2,
                  ),
                  const Text(
                    'And I thought I was so smart',
                    textScaleFactor: 2,
                  ),
                ],
              ))),
      Expanded(
          child: Container(
              color: Colors.orangeAccent,
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.all(4),
              child: ListView.builder(
                  itemCount: 100,
                  itemExtent: 30.0, //强制高度为30.0
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text("$index"));
                  }))),
      Expanded(
          child: Container(
        color: Colors.greenAccent,
        child: ListView.separated(
          itemCount: 100,
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("$index"));
          },
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            return Divider(color: Colors.black);
          },
        ),
      )),
      Expanded(
          child: Container(
        color: Colors.cyanAccent,
        child: InfiniteListView(),
      ))
    ]);
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          _words
              .take(20)
              .map((value) => _words.indexOf(value).toString())
              .toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}

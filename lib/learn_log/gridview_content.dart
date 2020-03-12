import 'package:flutter/material.dart';

class GridViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Container(
            color: Colors.cyanAccent,
            margin: EdgeInsets.all(4),
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //横轴三个子widget
                    childAspectRatio: 2.0 //宽高比为1，子widget
                    ),
                children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast)
                ])),
      ),
      Expanded(
        child: Container(
            color: Colors.cyanAccent,
            margin: EdgeInsets.all(4),
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 2.0,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            )),
      ),
      Expanded(
        child: Container(
            color: Colors.cyanAccent,
            margin: EdgeInsets.all(4),
            child: GridView(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120.0, childAspectRatio: 2.0 //宽高比为2
                  ),
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            )),
      ),
      Expanded(
        child: Container(
            color: Colors.cyanAccent,
            margin: EdgeInsets.all(4),
            child: InfiniteGridView()),
      ),
    ]);
  }
}

class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //每行三列
            childAspectRatio: 2.0 //显示区域宽高相等
            ),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          //如果显示到最后一个并且Icon总数小于200时继续获取数据
          if (index == _icons.length - 1 && _icons.length < 200) {
            _retrieveIcons();
          }
          return Icon(_icons[index]);
        });
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 500)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}

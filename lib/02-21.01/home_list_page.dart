import 'package:flutter/material.dart';

import 'item_page.dart';

class HomeListPage extends StatelessWidget {
  HomeListPage({Key key, this.title}) : super(key: key);

  final String title;
  final _items = <String>['Text', 'Button', 'Image/Icon'];

  @override
  Widget build(BuildContext context) {
    var d1 = Divider(color: Colors.blue);
    var d2 = Divider(color: Colors.green);
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
      body: Column(children: <Widget>[
        ListTile(title: Text('学习日志')),
        Expanded(
          child: ListView.separated(
            itemCount: _items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: Text(_items[index]),
                onTap: () => itemClicked(context, index),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? d1 : d2;
            },
          ),
        ),
      ]),
    );
  }

  void itemClicked(BuildContext context, int index) async {
    var snackbar = SnackBar(content: Text(_items[index]));
    Scaffold.of(context).showSnackBar(snackbar);

    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ItemPage(title: _items[index]);
    }));
  }
}

import 'package:flutter/material.dart';

import 'demo/bottom_sheet_page.dart';
import 'demo/dialog_page.dart';
import 'demo/login_page.dart';
import 'learn_log/item_page.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final _logItems = LogItem.values.reversed.toList();
  static final _demoItems = DemoItem.values;

  static final _items = {'学习记录': _logItems, 'Demo': _demoItems};

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Container(
          child: Container(
            color: Theme.of(context).canvasColor,
            child: SafeArea(
              top: orientation != Orientation.portrait,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(widget.title),
                ),
                body: _buildBoday(context),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBoday(BuildContext context) {
    return ListView.builder(
      //build的item为header的内容
      itemBuilder: (context, index) {
        var key = _items.keys.toList()[index];
        var list = _items[key];
        return ExpansionTile(
          title: Text(key),
          leading: Icon(index == 0 ? Icons.widgets : Icons.developer_mode),
          children: list.map((item) {
            var title = item.toString().split('.').last;
            return ListTile(
              title: Text(title),
              onTap: () => _itemClicked(context, item, title),
            );
          }).toList(),
        );
      },
      itemCount: _items.length,
    );
  }

  void _itemClicked(BuildContext context, dynamic item,
      [String title = '']) async {
    if (item is DemoItem) {
      Widget widget;
      switch (item) {
        case DemoItem.Login:
          widget = LoginPage();
          break;
        case DemoItem.Dialog:
          widget = DialogPage();
          break;
        case DemoItem.BottoSheet:
          widget = BottomSheetPage();
          break;
        default:
          widget = Container();
      }

      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget;
      }));
    } else if (item is LogItem) {
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ItemPage(title: title);
      }));
    } else {
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Container();
      }));
    }
  }
}

enum DemoItem {
  Login,
  Dialog,
  BottoSheet,
}

enum LogItem {
  Text,
  Button,
  Image,
  Switch,
  Checkbox,
  Radio,
  Slider,
  Progress,
  TextField,
  Form,
  Column,
  Row,
  Wrap,
  Flow,
  Stack,
  Align,
  Padding,
  ConstrainedBox,
  DecoratedBox,
  Transform,
  Container,
  Clip,
  SingleChildScroll,
  Listview,
  Gridview,
  CustomScrollView,
  ScrollController,
  Draggable,
  Stepper,
  DataTable,
  PaginatedDataTable,
}

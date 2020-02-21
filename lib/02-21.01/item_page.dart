import 'package:flutter/material.dart';
import 'package:hello_flutter/02-21.01/text_content.dart';

class ItemPage extends StatelessWidget {
  ItemPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: getWidget(title),
    );
  }

  Widget getWidget(String title) {
    if (title == 'Text') {
      return TextContent();
    } else {
      return Container();
    }
  }
}

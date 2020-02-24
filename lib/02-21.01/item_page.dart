import 'package:flutter/material.dart';
import 'package:hello_flutter/02-24.02/button_content.dart';
import 'package:hello_flutter/02-24.02/image_content.dart';
import 'package:hello_flutter/02-24.02/text_content.dart';

class ItemPage<T extends Widget> extends StatelessWidget {
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
    } else if (title == 'Button') {
      return ButtonContent();
    } else if (title == 'Image/Icon') {
      return ImageContent();
    } else {
      return Container();
    }
  }
}

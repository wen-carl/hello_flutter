import 'package:flutter/material.dart';

class ButtonContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: [
          RaisedButton(
            child: Text('Raised Button'),
            onPressed: () => showSnackbar(context, 'Raised button tapped!'),
          ),
          FlatButton(
            child: Text("Flat Button"),
            onPressed: () => showSnackbar(context, 'Flat button tapped!'),
          ),
          OutlineButton(
            child: Text("Outline Button"),
            onPressed: () => showSnackbar(context, 'Outline button tapped!'),
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => showSnackbar(context, 'Icon button tapped!'),
          ),
          OutlineButton.icon(
            icon: Icon(Icons.send),
            label: Text('Button With Icon'),
            onPressed: () => showSnackbar(context, 'Button With Icon tapped!'),
          ),
          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Custom UI Flat Button"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () =>
                showSnackbar(context, 'Custom UI Flat Button tapped!'),
            onLongPress: () =>
                showSnackbar(context, 'Custom UI Flat Button long pressed!'),
          )
        ]);
  }

  void showSnackbar(BuildContext context, String msg) {
    var snackbar = SnackBar(content: Text(msg));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}

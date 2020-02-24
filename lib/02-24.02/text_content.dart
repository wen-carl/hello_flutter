import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        children: [
          Text('Hello Flutter!'),
          Text("Hello Flutter!", textAlign: TextAlign.center),
          Text('Hello Flutter! ' * 8, overflow: TextOverflow.ellipsis),
          Text(
            'Hello Flutter! ' * 10,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text('Hello Flutter!', textScaleFactor: 1.5),
          Text(
            "Hello world",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Home: "),
            TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    var snackbar = SnackBar(
                        content: Text('点击了 https://flutterchina.club'));
                    Scaffold.of(context).showSnackBar(snackbar);
                  }),
          ]))
        ]);
  }
}

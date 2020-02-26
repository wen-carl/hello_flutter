import 'package:flutter/material.dart';

class ColumnContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.greenAccent,
              child: Column(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    width: 64,
                    child: Container(color: Colors.yellow),
                  ),
                  SizedBox(
                    height: 200,
                    width: 100,
                    child: Container(color: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.orangeAccent,
              child: Column(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    width: 64,
                    child: Container(color: Colors.yellow),
                  ),
                  SizedBox(
                    height: 200,
                    width: 100,
                    child: Container(color: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}

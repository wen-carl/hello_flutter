import 'package:flutter/material.dart';

class RowContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.greenAccent,
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(
                    height: 64,
                    width: 100,
                    child: Container(color: Colors.yellow),
                  ),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: Container(color: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.orangeAccent,
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  SizedBox(
                    height: 64,
                    width: 100,
                    child: Container(color: Colors.yellow),
                  ),
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: Container(color: Colors.lightBlueAccent),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}

import 'package:flutter/material.dart';

class ConstrainedBoxContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints:
                  BoxConstraints(minWidth: double.infinity, minHeight: 50),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
            Container(height: 8),
            SizedBox(
              width: 80,
              height: 80,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red[400]),
              ),
            ),
            Container(height: 8),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 80.0, height: 80.0),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red[300]),
              ),
            ),
            Container(height: 8),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: 80.0,
                  maxHeight: 80.0,
                  minWidth: 80.0,
                  maxWidth: 80.0),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red[200]),
              ),
            ),
            Container(height: 8),
            ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red[100]),
                  ),
                )),
            Container(height: 8),
            ConstrainedBox(
                constraints:
                    BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
                child: UnconstrainedBox(
                  alignment: Alignment.center,
                  //“去除”父级限制
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.blue),
                    ),
                  ),
                )),
            Container(height: 8),
            LimitedBox(
              child: Container(color: Colors.blue[700]),
              maxHeight: 60,
              maxWidth: 80, // TODO: ?
            ),
            Container(height: 8),
            AspectRatio(
                aspectRatio: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.green),
                )),
          ]),
    ));
  }
}

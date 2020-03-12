import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart';

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomSheet'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () {
          //Scaffold.of(context).showSnackBar();
        },
      ),
      body: RandomContainer(
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                    child: Text('BottomSheet'),
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (context) => ListView(
                            // 生成一个列表选择器
                            children: List.generate(
                          10,
                          (index) => InkWell(
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 60.0,
                                  child: Text('Item ${index + 1}')),
                              onTap: () {
                                print('tapped item ${index + 1}');
                                Navigator.of(context).pop(index);
                              }),
                        )),
                      );
                    },
                  );
                },
              ),
              // RaisedButton(
              //   child: Text('BottomSheet'),
              //   onPressed: () {
              //     showBottomSheet(
              //       context: context,
              //       builder: (context) => ListView(
              //           // 生成一个列表选择器
              //           children: List.generate(
              //         20,
              //         (index) => InkWell(
              //             child: Container(
              //                 alignment: Alignment.center,
              //                 height: 60.0,
              //                 child: Text('Item ${index + 1}')),
              //             onTap: () {
              //               print('tapped item ${index + 1}');
              //               Navigator.of(context).pop(index);
              //             }),
              //       )),
              //     );
              //   },
              // ),
              RaisedButton(
                child: Text('ModalBottomSheet'),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ListView(
                        // 生成一个列表选择器
                        children: List.generate(
                      20,
                      (index) => InkWell(
                          child: Container(
                              alignment: Alignment.center,
                              height: 60.0,
                              child: Text('Item ${index + 1}')),
                          onTap: () {
                            print('tapped item ${index + 1}');
                            Navigator.of(context).pop(index);
                          }),
                    )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

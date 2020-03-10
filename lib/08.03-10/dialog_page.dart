import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart';

class DialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: RandomContainer(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                      onPressed: () {
                        showMySimpleDialog(context);
                      },
                      child: Text("显示SimpleDialog,Material风格"));
                },
              ),
              RaisedButton(
                  onPressed: () {
                    showMyMaterialDialog(context);
                  },
                  child: Text("显示AlertDialog,Material风格")),
              RaisedButton(
                  onPressed: () {
                    showMyCupertinoDialog(context);
                  },
                  child: Text("显示AlertDialog,IOS风格")),
              RaisedButton(
                  onPressed: () {
                    showMyDialogWithValue(context);
                  },
                  child: Text("显示一个有返回值的对话框")),
              RaisedButton(
                  onPressed: () {
                    showMyDialogWithColumn(context);
                  },
                  child: Text("显示一个SingleChildScrollView+Column的对话框")),
              RaisedButton(
                  onPressed: () {
                    showMyDialogWithListView(context);
                  },
                  child: Text("显示一个ListView的对话框")),
              RaisedButton(
                  onPressed: () {
                    showMyDialogWithStateBuilder(context);
                  },
                  child: Text("显示一个StatefulBuilder的对话框")),
              RaisedButton(
                  onPressed: () {
                    showMyCustomLoadingDialog(context);
                  },
                  child: Text("显示一个自定义的对话框")),
            ],
          )),
    );
  }

  void showMyMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("title"),
            content: Text("内容内容内容内容内容内容内容内容内容内容内容"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("确认"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("取消"),
              ),
            ],
          );
        });
  }

  void showMyCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("title"),
            content: Text("内容内容内容内容内容内容内容内容内容内容内容"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了确定");
                },
                child: Text("确认"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了取消");
                },
                child: Text("取消"),
              ),
            ],
          );
        });
  }

  /*
  1.因为Dialog也是属于Navigator管理的，所以关闭对话框，直接用 Navigator.of(context).pop就行了
  2.ShowDialog()方法返回的是Future值,如果调用Navigator.of(context).pop()方法的时候，可以传递一些数值由Future返回。
    那么就可以用then()监听这个future所返回的数据了
   */
  void showMyDialogWithValue(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("title"),
            content: Text("内容内容内容内容内容内容内容内容内容内容内容"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了确定");
                },
                child: Text("确认"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了取消");
                },
                child: Text("取消"),
              ),
            ],
          );
        }).then((value) {
      debugPrint("对话框消失:$value");
    });
  }

  void showMyDialogWithColumn(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("title"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                  SizedBox(
                    height: 100,
                    child: Text("1"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text("确认"),
              ),
              FlatButton(
                onPressed: () {},
                child: Text("取消"),
              ),
            ],
          );
        });
  }

  void showMyDialogWithListView(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: Container(
          /*
              暂时的解决方法：要将ListView包装在具有特定宽度和高度的Container中
              如果Container没有定义这两个属性的话，会报错，无法显示ListView
               */
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                child: Text("1"),
              );
            },
            itemCount: 10,
            shrinkWrap: true,
          ),
        ));
      },
    );

    //如果直接将ListView放在dialog中，会报错，
  }

  void showMyDialogWithStateBuilder(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          bool selected = false;
          return AlertDialog(
            title: Text("StatefulBuilder"),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                child: CheckboxListTile(
                    title: Text("选项"),
                    value: selected,
                    onChanged: (bool) {
                      setState(() {
                        selected = !selected;
                      });
                    }),
              );
            }),
          );
        });
  }

  void showMySimpleDialog(BuildContext context) async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("SimpleDialog"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("SimpleDialogOption One"),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption One");
                },
              ),
              SimpleDialogOption(
                child: Text("SimpleDialogOption Two"),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption Two");
                },
              ),
              SimpleDialogOption(
                child: Text("SimpleDialogOption Three"),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption Three");
                },
              ),
            ],
          );
        });
    if (null == result) return;
    var snackbar = SnackBar(
      content: Text(result),
    );

    Scaffold.of(context).showSnackBar(snackbar);
  }

  void showMyCustomLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return MyCustomLoadingDialog();
        });

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
  }
}

class MyCustomLoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Duration insetAnimationDuration = const Duration(milliseconds: 100);
    Curve insetAnimationCurve = Curves.decelerate;

    RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)));

    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets +
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Material(
              elevation: 24.0,
              color: Theme.of(context).dialogBackgroundColor,
              type: MaterialType.card,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("加载中"),
                  ),
                ],
              ),
              shape: _defaultDialogShape,
            ),
          ),
        ),
      ),
    );
  }
}

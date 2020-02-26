import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(8),
      children: <Widget>[
        Image(
          image: AssetImage("images/saber.jpg"),
          width: 10, // 不起作用
          height: 100,
          fit: BoxFit.fill,
        ),
        Image.asset(
          'images/saber.jpg',
          height: 100,
        ),
        Image(
          image: NetworkImage(
              "https://upload-images.jianshu.io/upload_images/15405328-fb39e0b1759ca0c7.png?imageMogr2/auto-orient/strip|imageView2/2/w/640/format/webp"),
        ),
        Image.asset(
          'images/saber.jpg',
          height: 100,
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
        ),
        Image.asset(
          'images/saber.jpg',
          height: 100,
          repeat: ImageRepeat.repeatX,
        ),
        //Image.file('file'),
        Text(
          icons,
          style: TextStyle(
              fontFamily: "MaterialIcons", fontSize: 48.0, color: Colors.green),
        ),
      ],
    );
  }
}

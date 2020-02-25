import 'package:flutter/material.dart';
import 'package:hello_flutter/02-05.03/checkbox_content.dart';
import 'package:hello_flutter/02-05.03/form_content.dart';
import 'package:hello_flutter/02-05.03/progress_content.dart';
import 'package:hello_flutter/02-05.03/radio_content.dart';
import 'package:hello_flutter/02-05.03/slider_content.dart';
import 'package:hello_flutter/02-05.03/switch_content.dart';
import 'package:hello_flutter/02-05.03/textfield_content.dart';
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
    switch (title) {
      case 'Text':
        return TextContent();
        break;
      case 'Button':
        return ButtonContent();
        break;
      case 'Image/Icon':
        return ImageContent();
        break;
      case 'Switch':
        return SwitchContent();
        break;
      case 'Checkbox':
        return CheckboxContent();
        break;
      case 'Radio':
        return RadioContent();
        break;
      case 'Slider':
        return SliderContent();
        break;
      case 'Progress':
        return ProgressContent();
        break;
      case 'TextField':
        return TextFieldContent();
        break;
      case 'Form':
        return FormContent();
        break;
      default:
        return Container();
    }
  }
}

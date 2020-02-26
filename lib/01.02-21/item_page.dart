import 'package:flutter/material.dart';
import 'package:hello_flutter/02.02-24/button_content.dart';
import 'package:hello_flutter/02.02-24/image_content.dart';
import 'package:hello_flutter/02.02-24/text_content.dart';
import 'package:hello_flutter/03.02-05/checkbox_content.dart';
import 'package:hello_flutter/03.02-05/form_content.dart';
import 'package:hello_flutter/03.02-05/progress_content.dart';
import 'package:hello_flutter/03.02-05/radio_content.dart';
import 'package:hello_flutter/03.02-05/slider_content.dart';
import 'package:hello_flutter/03.02-05/switch_content.dart';
import 'package:hello_flutter/03.02-05/textfield_content.dart';

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

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
import 'package:hello_flutter/04.02-26/align_content.dart';
import 'package:hello_flutter/04.02-26/column_content.dart';
import 'package:hello_flutter/04.02-26/flow_content.dart';
import 'package:hello_flutter/04.02-26/row_content.dart';
import 'package:hello_flutter/04.02-26/stack_content.dart';
import 'package:hello_flutter/04.02-26/wrap_content.dart';
import 'package:hello_flutter/05.02-27/clip_contemt.dart';
import 'package:hello_flutter/05.02-27/constrainedbox_content.dart';
import 'package:hello_flutter/05.02-27/container_content.dart';
import 'package:hello_flutter/05.02-27/decoratedbox_content.dart';
import 'package:hello_flutter/05.02-27/padding_content.dart';
import 'package:hello_flutter/05.02-27/transform_content.dart';

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
      case 'Column':
        return ColumnContent();
        break;
      case 'Row':
        return RowContent();
        break;
      case 'Wrap':
        return WrapContent();
        break;
      case 'Flow':
        return FlowContent();
        break;
      case 'Stack':
        return StackContent();
      case 'Align':
        return AlignContent();
      case 'Padding':
        return PaddingContent();
      case 'ConstrainedBox':
        return ConstrainedBoxContent();
      case 'DecoratedBox':
        return DecoratedBoxContent();
      case 'Transform':
        return TransformContent();
      case 'Container':
        return ContainerContent();
      case 'Clip':
        return ClipContent();
      default:
        return Container();
    }
  }
}

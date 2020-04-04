import 'package:flutter/material.dart';
import 'package:hello_flutter/learn_log/draggable_content.dart';
import 'package:hello_flutter/learn_log/expansion_panel_content.dart';
import 'package:hello_flutter/learn_log/padding_content.dart';
import 'package:hello_flutter/learn_log/paginated_datatable_content.dart';
import 'package:hello_flutter/learn_log/progress_content.dart';
import 'package:hello_flutter/learn_log/radio_content.dart';
import 'package:hello_flutter/learn_log/row_content.dart';
import 'package:hello_flutter/learn_log/scrollcontroller_content.dart';
import 'package:hello_flutter/learn_log/slider_content.dart';
import 'package:hello_flutter/learn_log/stack_content.dart';
import 'package:hello_flutter/learn_log/stepper_content.dart';
import 'package:hello_flutter/learn_log/switch_content.dart';
import 'package:hello_flutter/learn_log/text_content.dart';
import 'package:hello_flutter/learn_log/textfield_content.dart';
import 'package:hello_flutter/learn_log/transform_content.dart';
import 'package:hello_flutter/learn_log/wrap_content.dart';

import 'align_content.dart';
import 'button_content.dart';
import 'checkbox_content.dart';
import 'clip_contemt.dart';
import 'column_content.dart';
import 'constrainedbox_content.dart';
import 'container_content.dart';
import 'custom_scroll_view_content.dart';
import 'datatable_content.dart';
import 'decoratedbox_content.dart';
import 'flow_content.dart';
import 'form_content.dart';
import 'gridview_content.dart';
import 'image_content.dart';
import 'listview_content.dart';
import 'single_child_scroll_content.dart';

class ItemPage<T extends Widget> extends StatelessWidget {
  ItemPage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: getWidget(title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alert),
        onPressed: () {},
      ),
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
      case 'Image':
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
      case 'SingleChildScroll':
        return SingleChildScrollContent();
      case 'Listview':
        return ListViewContent();
      case 'Gridview':
        return GridViewContent();
      case 'CustomScrollView':
        return CustomScrollViewContent();
      case 'ScrollController':
        return ScrollControllerContent();
      case 'Draggable':
        return DraggableContent();
      case 'Stepper':
        return StepperContent();
      case 'DataTable':
        return DataTableContent();
      case 'PaginatedDataTable':
        return PaginatedDataTableContent();
      case 'ExpansionPanel':
        return ExpansionPanelContent();
      default:
        return Container(
          child: Center(
            child: Text('Error: $title is not implemented!'),
          ),
        );
    }
  }
}

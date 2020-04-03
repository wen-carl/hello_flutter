import 'package:flutter/material.dart';
import 'package:hello_flutter/utils/msg.dart';

class StepperContent extends StatefulWidget {
  @override
  _StepperContentState createState() => _StepperContentState();
}

class _StepperContentState extends State<StepperContent> {
  final _steps = List<StepModel>.generate(4, (index) {
    return StepModel('Item $index', 'Subtitle $index', 'Hello step $index');
  });
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Stepper(
          currentStep: _current,
          onStepCancel: () {
            if (_current > 0) {
              setState(() {
                _current--;
              });
            } else {
              showSnackbar(context, 'This is first step!');
            }
          },
          onStepContinue: () {
            if (_current < _steps.length - 1) {
              setState(() {
                _current++;
              });
            } else {
              showSnackbar(context, 'All the ${_steps.length} steps are done!');
            }
          },
          onStepTapped: (index) {
            showSnackbar(context, 'Step $index is tapped!');
          },
          steps: _steps.map((item) {
            var index = _steps.indexOf(item);
            return Step(
              state: _getStepState(index),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
              content: Text(item.content),
              isActive: _current == index,
            );
          }).toList(),
        ),
      ),
    );
  }

  StepState _getStepState(int index) {
    var state = StepState.indexed;
    if (_current == index) {
      state = StepState.editing;
    } else if (index > _current) {
      state = StepState.indexed;
    } else {
      state = StepState.complete;
    }

    return state;
  }
}

class StepModel {
  final String title;
  final String subtitle;
  final String content;

  StepModel(this.title, this.subtitle, this.content);
}

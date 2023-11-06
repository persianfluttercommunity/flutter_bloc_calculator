import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant/operators.dart';
import '../../view_models/calculator_view_model.dart';

class ActionButton extends ElevatedButton {
  ActionButton(CalculatorOperation operation, Widget icon, BuildContext context,
      {super.key})
      : super(
            onPressed: () {
              context.read<CalculatorViewModel>().setOperation(operation);
            },
            child: icon);
}

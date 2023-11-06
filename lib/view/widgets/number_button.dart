import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_calculator/view_models/calculator_view_model.dart';

class NumberButton extends ElevatedButton {
  NumberButton(int number, BuildContext context, {super.key})
      : super(
            onPressed: () {
              context.read<CalculatorViewModel>().addNumber(number);
            },
            child: Text(number.toString()));
}

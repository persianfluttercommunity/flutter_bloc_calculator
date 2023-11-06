import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_calculator/constant/operators.dart';
import 'package:flutter_bloc_calculator/view_models/calculator_view_model.dart';

import 'action_button.dart';
import 'number_button.dart';

class CalculatorKeypad extends StatelessWidget {
  const CalculatorKeypad({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: keypadContent(context),
    );
  }

  List<Widget> keypadContent(BuildContext context) {
    List<Widget> lst = [];
    lst.add(NumberButton(7, context));
    lst.add(NumberButton(8, context));
    lst.add(NumberButton(9, context));
    lst.add(ActionButton(
        CalculatorOperation.subtraction, const Icon(Icons.remove), context));
    lst.add(NumberButton(4, context));
    lst.add(NumberButton(5, context));
    lst.add(NumberButton(6, context));
    lst.add(ActionButton(
        CalculatorOperation.summation, const Icon(Icons.add), context));
    lst.add(NumberButton(1, context));
    lst.add(NumberButton(2, context));
    lst.add(NumberButton(3, context));
    lst.add(ActionButton(
        CalculatorOperation.multiplication, const Icon(Icons.close), context));
    lst.add(ElevatedButton(
        onPressed: () {
          context.read<CalculatorViewModel>().removeNumber();
        },
        child: const Icon(Icons.backspace)));
    lst.add(NumberButton(0, context));
    lst.add(ElevatedButton(
        onPressed: () {
          context.read<CalculatorViewModel>().calculate();
        },
        child: const Text("=")));
    lst.add(ActionButton(CalculatorOperation.division,
        const Icon(Icons.percent_rounded), context));
    return lst;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc_calculator/constant/operators.dart';

class CalculatorModel {
  double result = 0.0;
  double temp = 0.0;
  CalculatorOperation operation = CalculatorOperation.none;
  TextEditingController editorController = TextEditingController(text: "0");
}

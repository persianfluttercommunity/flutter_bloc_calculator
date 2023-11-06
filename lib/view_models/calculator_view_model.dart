import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_calculator/constant/operators.dart';
import 'package:flutter_bloc_calculator/models/calculator_model.dart';

class CalculatorViewModel extends Cubit<CalculatorModel> {
  CalculatorModel model;

  CalculatorViewModel(this.model) : super(model);

  void addNumber(int n) {
    model.result = model.result * 10 + n;
    model.editorController.text = model.result.toString();
    emit(model);
  }

  void removeNumber() {
    if (model.operation == CalculatorOperation.none) {
      model.result = 0.0;
    } else {
      model.result = model.result % 10;
    }

    model.editorController.text = model.result.toString();
    emit(model);
  }

  void clearScreen() {
    model.result = 0.0;
    model.operation = CalculatorOperation.none;
    model.temp = 0.0;
    model.editorController.text = model.result.toString();
    emit(model);
  }

  void setOperation(CalculatorOperation operation) {
    model.operation = operation;
    model.temp = model.result;
    model.result = 0.0;
    emit(model);
  }

  void calculate() {
    switch (model.operation) {
      case CalculatorOperation.none:
        break;
      case CalculatorOperation.summation:
        model.result = model.temp + model.result;
        break;
      case CalculatorOperation.subtraction:
        model.result = model.temp - model.result;
        break;
      case CalculatorOperation.division:
        model.result = model.temp / model.result;
        break;
      case CalculatorOperation.multiplication:
        model.result = model.temp * model.result;
        break;
    }
    model.operation = CalculatorOperation.none;
    model.temp = 0.0;
    model.editorController.text = model.result.toString();
    emit(model);
  }
}

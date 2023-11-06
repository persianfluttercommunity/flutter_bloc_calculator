import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_calculator/models/calculator_model.dart';
import 'package:flutter_bloc_calculator/view/pages/calculator_page.dart';
import 'package:flutter_bloc_calculator/view_models/calculator_view_model.dart';

import 'constant/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Calculator',
      theme: theme,
      home: BlocProvider(
        create: (_) => CalculatorViewModel(CalculatorModel()),
        child: const CalculatorPage(),
      ),
    );
  }
}

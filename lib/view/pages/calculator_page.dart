import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_calculator/models/calculator_model.dart';
import 'package:flutter_bloc_calculator/view/widgets/calculator_keypad.dart';
import 'package:flutter_bloc_calculator/view_models/calculator_view_model.dart';

/// all of project is in this Stateless Widget
class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child:
                            BlocBuilder<CalculatorViewModel, CalculatorModel>(
                          builder: (context, model) {
                            return TextField(
                              readOnly: true,
                              controller: model.editorController,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<CalculatorViewModel>().clearScreen();
                            // Provider.of<CalculatorModel>(context, listen: false)
                            //     .clearScreen();
                          },
                          child: const Text("Clear")),
                    ],
                  )),
              const Expanded(child: CalculatorKeypad())
            ],
          ),
        ),
      ),
    );
  }
}

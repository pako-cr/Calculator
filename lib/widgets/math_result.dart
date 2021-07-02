import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:calculadora/controllers/calculator_controller.dart';
import 'line_separator.dart';
import 'main_result.dart';
import 'sub_result.dart';

class MathResult extends StatelessWidget {
  // const MathResult({Key? key}) : super(key: key);

  final calculatorCtrl = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            SubResult(text: '${calculatorCtrl.firstNumber}'),
            SubResult(text: '${calculatorCtrl.operation}'),
            SubResult(text: '${calculatorCtrl.secondNumber}'),
            LineSeparator(),
            MainResultText(text: '${calculatorCtrl.mathResult}'),
          ],
        ));
  }
}

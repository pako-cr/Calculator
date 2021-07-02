import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = ''.obs;
  var secondNumber = ''.obs;
  var operation = ''.obs;
  var mathResult = '0'.obs;

  acButtonPressed() {
    firstNumber.value = '0';
    secondNumber.value = '';
    operation.value = '';
    mathResult.value = '0';
  }

  addNumber(String number) {
    if (mathResult.value == '0') return mathResult.value = number;

    if (mathResult.value == '-0') {
      return mathResult.value = '-' + number;
    }

    mathResult.value = mathResult.value + number;
  }

  changeNegativePositive() {
    if (mathResult.startsWith('-')) {
      mathResult.value = mathResult.value.replaceAll('-', '');
    } else {
      mathResult.value = '-' + mathResult.value;
    }
  }

  addDecimalPoint() {
    if (mathResult.contains('.')) return;

    if (mathResult.startsWith('0')) {
      mathResult.value = '0.';
    } else {
      mathResult.value = mathResult.value + '.';
    }
  }

  selectOperation(String newOperation) {
    operation.value = newOperation;
    firstNumber.value = mathResult.value;

    mathResult.value = '0';
  }

  deleteLastEntry() {
    if (mathResult.value.replaceAll('-', '').length > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = '0';
    }
  }

  resolveMathOperation() {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);
    secondNumber.value = mathResult.value;

    var result = 0.0;

    switch (operation.value) {
      case '+':
        result = resolveSum(num1, num2);
        break;

      case '-':
        result = resolveExtract(num1, num2);
        break;

      case 'X':
        result = resolveMult(num1, num2);
        break;

      case '/':
        result = resolveDiv(num1, num2);
        break;
      default:
        break;
    }

    if (result.toString().endsWith('.0')) {
      mathResult.value = result.floor().toString();
    } else {
      mathResult.value = result.toString();
    }
  }

  resolveSum(double firstNumber, double secondNumber) {
    print('$firstNumber + $secondNumber');
    return firstNumber + secondNumber;
  }

  resolveExtract(double firstNumber, double secondNumber) {
    print('$firstNumber - $secondNumber');
    return firstNumber - secondNumber;
  }

  resolveMult(double firstNumber, double secondNumber) {
    print('$firstNumber * $secondNumber');
    return firstNumber * secondNumber;
  }

  resolveDiv(double firstNumber, double secondNumber) {
    print('$firstNumber / $secondNumber');
    return firstNumber / secondNumber;
  }
}

import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var firstNumber = "0".obs;
  var secondNumber = "0".obs;
  var mathResult = "0".obs;
  var operation = "+".obs;

//AC
  void resetAll() {
    //Se puede utilizar .value o .obs

    firstNumber.value = "0";
    secondNumber.value = "0";
    mathResult = "0".obs;
    operation.value = "+";
  }

//Agrega un numero al mathResult. Si mathResult es == 0 agrega el nuevo numero y sino lo concatena con el que estaba.
  String? addNumber(String number) {
    if (mathResult.value == "0") {
      return mathResult.value = number;
    }
    if (mathResult.value == "-0") {
      return mathResult.value = "-" + number;
    }

    mathResult.value = mathResult.value + number;
  }

//funcion +/-. Cambia negativo por positivo y viceversa
  changeNegativePositive() {
    if (mathResult.value.startsWith("-")) {
      mathResult.value = mathResult.value.replaceFirst("-", "");
    } else {
      mathResult.value = "-" + mathResult.value;
    }
  }

//Agregar .
  addDecimalPoint() {
    if (mathResult.value.contains(".")) return;

    if (mathResult.value.startsWith("0")) {
      mathResult.value = "0.";
    } else {
      mathResult.value = mathResult.value + ".";
    }
  }

  //Seleccionar operador
  selectOperation(String newOperation) {
    operation.value = newOperation;
    firstNumber.value = mathResult.value;
    mathResult.value = "0";
  }

  //Elimina la ultima entrada
  deleteLastEntry() {
    if (mathResult.value.replaceAll("-", "").length > 1) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 1);
    } else {
      mathResult.value = "0";
    }
  }

  calculateResult() {
    double num1 = double.parse(firstNumber.value);
    double num2 = double.parse(mathResult.value);

    secondNumber.value = mathResult.value;

    switch (operation.value) {
      case "+":
        mathResult.value = "${num1 + num2}";
        break;

      case "-":
        mathResult.value = "${num1 - num2}";
        break;

      case "/":
        mathResult.value = "${num1 / num2}";
        break;

      case "X":
        mathResult.value = "${num2 * num1}";
        break;

      default:
        return;
    }

    if (mathResult.value.endsWith(".0")) {
      mathResult.value =
          mathResult.value.substring(0, mathResult.value.length - 2);
    }
  }
}

import 'package:f_calculator/models/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test("soma", () {
    final calculator = Calculator();
    calculator.addSymbol("2");
    calculator.addSymbol("+");
    calculator.addSymbol("2");
    calculator.equals();
    expect(calculator.expression, "4");
  });

}

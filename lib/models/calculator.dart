import 'package:expressions/expressions.dart';
import 'package:f_calculator/models/operation.dart';

enum CalculatorAction {
  ADD_SYMBOL, EQUALS, BACKSPACE, CLEAR, GET_LAST_OPERATION
}

class Calculator {

  String _expression = "0";
  String get expression => _expression;
  final _operations = [];

  void addSymbol(String symbol) {
    _expression = _expression == "0" ? symbol : _expression + symbol;
  }

  void backspace() {
    final displayContentSize = _expression.length - 1;
    if(displayContentSize > 0) {
      _expression = _expression.substring(0, _expression.length - 1);
    } else {
      _expression = "0";
    }
  }

  void clear() {
    _expression = "0";
  }

  void equals() {
    final expression = Expression.parse(_expression);
    final result = ExpressionEvaluator().eval(expression, {}).toString();
    _operations.add((Operation(_expression, result)));
    _expression = result;
  }

  void getLastOperation() {
    _expression = _operations.last.expression;
  }

  List getAllOperations() => _operations;

  void deleteOperation(Operation toRemove) {
    _operations.removeWhere((operation) => operation == toRemove);
  }

}
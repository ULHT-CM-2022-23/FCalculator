import 'package:equatable/equatable.dart';

class Operation extends Equatable {

  final String expression;
  final String result;

  Operation(this.expression, this.result);

  @override
  List<Object?> get props => [expression, result];

  @override
  String toString() {
    return "$expression = $result";
  }

}
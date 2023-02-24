import 'package:f_calculator/models/calculator.dart';
import 'package:f_calculator/screens/calculator_screen.dart';
import 'package:f_calculator/screens/history_screen.dart';
import 'package:f_calculator/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(
        screens: [
          CalculatorScreen(calculator: calculator, title: 'Calculadora'),
          HistoricScreen(
              calculator: calculator,
              title: 'Histórico')
        ],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Calculadora"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Histórico"
          ),
        ],
      ),
    );
  }
}
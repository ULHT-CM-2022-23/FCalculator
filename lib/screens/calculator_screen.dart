import 'package:f_calculator/models/calculator.dart';
import 'package:flutter/material.dart';
import 'package:f_calculator/widgets/button.dart';

class CalculatorScreen extends StatefulWidget {

  final String title;
  final Calculator calculator;

  CalculatorScreen({Key? key, required this.calculator, required this.title}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: <Widget>[
          buildDisplay(widget.calculator.expression),
          buildKeyboard(_doAction),
        ],
      ),
    );
  }

  _doAction(CalculatorAction action, {String? symbol}) {
    if(CalculatorAction.ADD_SYMBOL == action) widget.calculator.addSymbol(symbol!);
    else if (CalculatorAction.EQUALS == action) widget.calculator.equals();
    else if (CalculatorAction.GET_LAST_OPERATION == action) widget.calculator.getLastOperation();
    else if (CalculatorAction.BACKSPACE == action) widget.calculator.backspace();
    else if (CalculatorAction.CLEAR == action) widget.calculator.clear();
    setState(() {});
  }

  Widget buildDisplay(String expression) {
    return Container(
      color: Colors.black54,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.all(4.0),
              child: Text(
                expression,
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildKeyboard(Function doAction) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                text: "C",
                color: Colors.grey,
                onPressed: (symbol) => doAction(CalculatorAction.CLEAR),
              ),
              Button(
                  text: "<",
                  color: Colors.grey,
                  onPressed: (symbol) => doAction(CalculatorAction.BACKSPACE)
              ),
              Button(
                text: "last",
                color: Colors.orange,
                onPressed: (symbol) => doAction(CalculatorAction.GET_LAST_OPERATION)
              ),
              Button(
                text: "/",
                color: Colors.orange,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                text: "7",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                text: "8",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                text: "9",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                text: "*",
                color: Colors.orange,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                text: "4",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                text: "5",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                text: "6",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
              Button(
                text: "-",
                color: Colors.orange,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol)
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                text: "1",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol),
              ),
              Button(
                text: "2",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol),
              ),
              Button(
                text: "3",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol),
              ),
              Button(
                text: "+",
                color: Colors.orange,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Button(
                text: "0",
                horizontalDouble: true,
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol),
              ),
              Button(
                text: ".",
                color: Colors.black54,
                onPressed: (symbol) => doAction(CalculatorAction.ADD_SYMBOL, symbol: symbol),
              ),
              Button(
                text: "=",
                color: Colors.orange,
                onPressed: (symbol) => doAction(CalculatorAction.EQUALS),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

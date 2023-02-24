import 'package:f_calculator/models/calculator.dart';
import 'package:f_calculator/models/operation.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  final Calculator calculator;
  final Operation operation;

  const DetailScreen({Key? key, required this.calculator, required this.operation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(operation.expression),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: cardWidth,
                  height: cardWidth,
                  child: Card(
                    child: Container(
                      margin: EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text("Text"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: cardWidth,
                  height: cardWidth,
                  child: Card(
                    child: Column(
                      children: [
                        Text("Operation"),
                        Text(operation.expression)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                  onPressed: () {
                    calculator.deleteOperation(operation);
                    Navigator.pop(context);
                  },
                  child: Text("Delete")
              ),
            ),
          ],
        ),
      ),
    );
  }

}

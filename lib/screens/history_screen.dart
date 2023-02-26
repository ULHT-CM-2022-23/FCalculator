import 'package:f_calculator/models/calculator.dart';
import 'package:flutter/material.dart';

class HistoricScreen extends StatefulWidget {

  final String title;
  final Calculator calculator;

  const HistoricScreen({Key? key, required this.calculator, required this.title}) : super(key: key);

  @override
  State<HistoricScreen> createState() => _HistoricScreenState();
}

class _HistoricScreenState extends State<HistoricScreen> {

  @override
  Widget build(BuildContext context) {
    final operations = widget.calculator.getAllOperations();
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body: ListView.builder(
        itemCount: operations.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(12),
            leading: Image.asset('lib/assets/logo.jpg'),
            title: Text(
              operations[index].toString(),
              style: TextStyle(
                fontSize: 24
              ),
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        },
      ),
    );
  }

}

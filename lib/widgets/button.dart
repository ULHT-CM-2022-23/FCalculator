import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool horizontalDouble;
  final Function onPressed;
  final String text;
  final Color color;

  Button({
    required this.text,
    required this.onPressed,
    this.horizontalDouble = false,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 4;
    Orientation orientation = MediaQuery.of(context).orientation;
    bool isLandscape = orientation == Orientation.landscape;
    double factor = isLandscape ? 10 : 8;
    return Container(
      width: horizontalDouble ? (width * 2) : width,
      height: MediaQuery.of(context).size.height / factor,
      padding: EdgeInsets.all(2.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: this.color),
        onPressed: () => onPressed(text),
        child: Text(
          this.text,
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
      ),
    );
  }
}

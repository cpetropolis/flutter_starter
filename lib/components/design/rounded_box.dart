import 'package:flutter/material.dart';

class RoundedBox extends StatelessWidget {
  RoundedBox({
    required this.height,
    required this.colour,
    required this.cardChild,
    this.variableHeight,
  });

  final Color colour;
  final Widget cardChild;
  final double height;
  bool? variableHeight = null;

  @override
  Widget build(BuildContext context) {
    if (variableHeight != null) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(10),
          child: cardChild,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    } else {
      return GestureDetector(
        child: Container(
          height: height,
          padding: EdgeInsets.all(10),
          child: cardChild,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    }
  }
}

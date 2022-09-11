import 'package:flutter/material.dart';

class SelectorSubunit extends StatelessWidget {
  SelectorSubunit(
      {required this.selectorNumber,
      required this.groupNumber,
      required this.onPress,
      required this.label});

  final int selectorNumber;
  final int groupNumber;
  final void Function() onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        padding: EdgeInsets.all(3),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
        decoration: BoxDecoration(
            color: determineSelected(selectorNumber, groupNumber),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

Color determineSelected(int selectorNumber, int groupNumber) {
  if (selectorNumber != groupNumber) {
    return (Colors.white);
  } else {
    return (Color(0xFFCEFDFF));
  }
}

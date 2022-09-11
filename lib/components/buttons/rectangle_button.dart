import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  RectangleButton({
    required this.height,
    required this.colour,
    required this.cardChild,
    required this.onPress,
  });

  final Color colour;
  final Widget cardChild;
  final void Function() onPress;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height,
        padding: EdgeInsets.all(10),
        child: cardChild,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: colour,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
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
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

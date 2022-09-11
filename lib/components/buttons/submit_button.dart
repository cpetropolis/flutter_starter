import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_base/components/design/constants.dart';

class SubmitBox extends StatelessWidget {
  SubmitBox({required this.onPress});

  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 55,
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            'Submit',
            style: textFieldStyle,
          ),
        ),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        decoration: BoxDecoration(
          color: Color(0xFFCEFDFF),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

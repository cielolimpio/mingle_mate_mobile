import 'package:flutter/material.dart';

class MingleMateElevatedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  double? buttonWidth = 160.0;
  double? buttonHeight = 60.0;

  MingleMateElevatedButton(
      {required this.text,
      required this.buttonColor,
      required this.textColor,
      double? buttonWidth,
      double? buttonHeight,
      Key? key})
      : super(key: key) {
    if (buttonWidth != null) {
      this.buttonWidth = buttonWidth;
    }
    if (buttonHeight != null) {
      this.buttonHeight = buttonHeight;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (buttonWidth != null) buttonWidth = buttonWidth;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            fixedSize: Size(buttonWidth!, buttonHeight!)),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

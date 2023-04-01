import 'package:flutter/material.dart';

class MingleMateIconButton extends StatelessWidget {
  final IconData icons;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  double? buttonWidth = 160.0;
  double? buttonHeight = 60.0;

  MingleMateIconButton(
      {required this.icons,
      required this.text,
      required this.buttonColor,
      required this.textColor,
      double? buttonWidth,
      double? buttonHeight,
      required this.onPressed,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icons),
        label: Text(text, style: TextStyle(color: textColor),),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          fixedSize: Size(buttonWidth!, buttonHeight!),
        ),
      ),
    );
  }
}

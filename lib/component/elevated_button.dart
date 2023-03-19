import 'package:flutter/material.dart';

class MingleMateElevatedButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  const MingleMateElevatedButton({required this.text, required this.buttonColor, required this.textColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
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

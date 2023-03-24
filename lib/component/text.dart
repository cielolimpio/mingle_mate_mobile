import 'package:flutter/material.dart';

class MingleMateMainText extends StatelessWidget {
  final String text;
  final double verticalPadding;
  final double horizontalPadding;

  const MingleMateMainText(
      {required this.text,
      required this.verticalPadding,
      required this.horizontalPadding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class MingleMateSubText extends StatelessWidget {
  final String text;
  final double verticalPadding;
  final double horizontalPadding;

  const MingleMateSubText({required this.text, required this.verticalPadding, required this.horizontalPadding, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}


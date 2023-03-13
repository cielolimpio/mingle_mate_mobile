import 'package:flutter/material.dart';

class MingleMateAppBar extends AppBar {
  final String appBarTitle;

  MingleMateAppBar({
    required this.appBarTitle
  }) : super(
    title: Text(appBarTitle)
  );
}

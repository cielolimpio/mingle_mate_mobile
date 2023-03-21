import 'package:flutter/material.dart';

class MingleMateAppBar extends PreferredSize {
  final String appBarTitle;

  MingleMateAppBar({
    super.key,
    required this.appBarTitle
  }) : super(
    preferredSize: Size.fromHeight(60.0),
    child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          appBarTitle,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'AppleSDGothicNeoBold',
              fontSize: 25
          ),
        ),
        centerTitle: true
    )
  );
}

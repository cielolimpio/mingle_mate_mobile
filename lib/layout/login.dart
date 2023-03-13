import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/layout/base/app_bar.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MingleMateAppBar(appBarTitle: "로그인"),
      ),
    );
  }
}

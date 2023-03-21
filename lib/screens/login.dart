import 'package:flutter/material.dart';
import '../component/app_bar.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MingleMateAppBar(appBarTitle: "로그인"),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // 화면 탭 시 키보드 사라지게
        },
      )
    );
  }
}

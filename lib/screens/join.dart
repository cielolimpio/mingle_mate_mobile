import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/component/elevated_button.dart';
import 'package:mingle_mate_mobile/component/mingle_mate_app_bar.dart';
import 'package:mingle_mate_mobile/component/text_form_field.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({Key? key}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MingleMateAppBar(appBarTitle: "회원 가입",),
      body: Form(
          key: formKey,
          child:
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                MingleMateTextFormField(label: "이름", onSaved: (newValue) {}, validator: (value) => null),
                MingleMateTextFormField(label: "이메일", onSaved: (newValue) {}, validator: (value) => null),
                MingleMateTextFormField(label: "비밀번호", onSaved: (newValue) {}, validator: (value) => null),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MingleMateElevatedButton(text: '취소하기', buttonColor: Colors.white, textColor: Color(0xFFFCADAD)),
                    MingleMateElevatedButton(text: '완료', buttonColor: Color(0xFFFCADAD), textColor: Colors.white)
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

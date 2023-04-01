import 'package:flutter/material.dart';
import '../component/app_bar.dart';
import '../component/elevated_button.dart';
import '../component/text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MingleMateAppBar(appBarTitle: "로그인"),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // 화면 탭 시 키보드 사라지게
        },
        child: Form(
            key: formKey,
            child:
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  MingleMateTextFormField(
                      label: "이메일",
                      onSaved: (newValue) {},
                      validator: (value){
                        if(value != null && value.isEmpty) {
                          return '이메일을 입력하지 않았습니다.';
                        }
                        if(!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value!)){
                          return '잘못된 이메일 형식입니다.';
                        }

                        return null;
                      }
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Column(
                      children: [
                        MingleMateTextFormField(
                            label: "비밀번호",
                            onSaved: (newValue) {},
                            validator: (value){
                              if(value != null && value.isEmpty){
                                return "비밀번호를 입력하지 않았습니다.";
                              }
                              if(!RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
                                  .hasMatch(value!)){
                                return "비밀번호는 최소 8자리, 영어, 특수문자 1개 이상을 포함해야 합니다.";
                              }
                              return null;
                            }
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MingleMateElevatedButton(
                        text: '회원가입',
                        buttonColor: Colors.white,
                        textColor: Color(0xFFFCADAD),
                        onPressed: () async {
                          Navigator.pushNamed(context, '/join');
                        },
                      ),
                      MingleMateElevatedButton(
                        text: '로그인',
                        buttonColor: Color(0xFFFCADAD),
                        textColor: Colors.white,
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                            print("검증 완료 - 로그인");
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
            )
        ),
      )
    );
  }
}

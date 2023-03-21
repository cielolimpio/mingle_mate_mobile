import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/component/elevated_button.dart';
import 'package:mingle_mate_mobile/component/slider_bar.dart';
import 'package:mingle_mate_mobile/component/text_form_field.dart';

import '../component/app_bar.dart';

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
                MingleMateTextFormField(
                    label: "이름",
                    onSaved: (newValue) {},
                    validator: (value){
                      if(value != null && value!.isEmpty){
                        print(value.length);
                        return "이름은 필수사항 입니다.";
                      }
                      return null;
                    }
                ),
                MingleMateTextFormField(
                    label: "이메일",
                    onSaved: (newValue) {},
                    validator: (value){
                      if(value != null && value.isEmpty) {
                        return '이메일은 필수사항 입니다.';
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
                              return "비밀번호는 필수사항 입니다.";
                            }
                            if(!RegExp(
                                r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$")
                                .hasMatch(value!)){
                              return "비밀번호는 최소 8자리, 영어, 특수문자 1개 이상을 포함해야 합니다.";
                            }

                            if(value.length > 20 ){
                              return "비밀번호는 최대 12자리 까지 가능합니다.";
                            }

                            return null;
                          }
                      ),
                      const Text("사용가능한 특수문자는 (!@#'\$%&*) 입니다."),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MingleMateElevatedButton(
                        text: '취소하기',
                        buttonColor: Colors.white,
                        textColor: Color(0xFFFCADAD),
                        onPressed: (){

                        },
                    ),
                    MingleMateElevatedButton(
                        text: '완료',
                        buttonColor: Color(0xFFFCADAD),
                        textColor: Colors.white,
                        onPressed: () async {
                          if(formKey.currentState!.validate()){
                            print("검증 완료");
                          }
                        },
                    )
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}

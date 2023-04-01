import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mingle_mate_mobile/component/app_bar.dart';
import 'package:mingle_mate_mobile/component/elevated_button.dart';
import 'package:mingle_mate_mobile/component/radio_button_period.dart';
import 'package:mingle_mate_mobile/component/radio_button_row.dart';
import 'package:mingle_mate_mobile/component/text.dart';
import 'package:mingle_mate_mobile/component/text_form_field.dart';
import '../component/dropdown.dart';
import '../constants/color.dart';
import '../constants/enum.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  List<XFile?> _pickedImageList = [];

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width / 3 - 16.0;
    final imageHeight = imageWidth;

    return Scaffold(
      appBar: MingleMateAppBar(
        appBarTitle: "프로필 등록",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            MingleMateMainText(
                text: '프로필 사진', verticalPadding: 8.0, horizontalPadding: 8.0),

            Row(
              children: [
                if(_pickedImageList.isNotEmpty)
                  _showImage(imageWidth, imageHeight),
                if(_pickedImageList.length != 3)
                  _noneImage(imageWidth),
              ],
            ),

            MingleMateTextFormField(
                label: "이름", onSaved: (newValue) {}, validator: (value) {}),
            MingleMateTextFormField(
                label: "나이",
                onSaved: (newValue) {},
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "나이는 필수사항 입니다.";
                  }
                  return null;
                }),
            MingleMateTextFormField(
                label: "주소",
                placeHolder: "주소를 입력해주세요. Ex) 서울시 관악구 봉천동",
                onSaved: (newValue) {},
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "주소는 필수사항 입니다.";
                  }
                  return null;
                }),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '성별',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            MingleMateRadioButtonRow(
                options: [Gender.MALE.korName, Gender.FEMALE.korName]
            ),
            const MingleMateMainText(
                text: '카테고리 (최대 3개까지 등록 가능)',
                verticalPadding: 8.0,
                horizontalPadding: 8.0),
            Column(
                children: [1, 2, 3].map((i) =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MingleMateSubText(
                            text: '카테고리${i}', verticalPadding: 2.0, horizontalPadding: 8.0),
                        const MingleMateDropdown(options: ['스터디', '스포츠', '게임']),
                        MingleMateSubText(
                            text: '카테고리 ${i}의 주기',
                            verticalPadding: 8.0,
                            horizontalPadding: 8.0),
                        MingleMateRadioButtonRow(
                          options: [Period.PERIODIC.korName, Period.FREE.korName, Period.NOMATTER.korName],
                        )
                      ]
                  )
              ).toList()
            ),

            MingleMateTextFormField(
              label: '자기소개(가능한 요일, 공부과목, 이상형 특징 등 자유롭게)',
              onSaved: (newValue) {},
              validator: (value) => null,
              placeHolder: "자기소개를 입력해주세요.",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MingleMateElevatedButton(
                    text: '취소',
                    buttonColor: Colors.white,
                    textColor: PRIMARY_COLOR,
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    }),
                MingleMateElevatedButton(
                    text: '등록 완료',
                    buttonColor: PRIMARY_COLOR,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    })
              ],
            )
          ],
        ),
      ),
    );
  }


  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            MingleMateElevatedButton(text: '갤러리', buttonColor: PRIMARY_COLOR, textColor: Colors.white, onPressed: (){
              _getPhotoLibraryImage();
            }),
            const SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }

  _getPhotoLibraryImage() async {
    final pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      imageQuality: 50
    );
    if (pickedImage != null) {
      setState(() {
        _pickedImageList.add(pickedImage);
        print(pickedImage.name);
      });
    } else {
      if (kDebugMode) {
        print('이미지 선택X');
      }
    }
  }

  _noneImage(double imageWidth) {
    return Container(
      color: Colors.white,
      height: imageWidth,
      width: imageWidth,
      // constraints: BoxConstraints(
      //     minHeight: MediaQuery.of(context).size.width / 4,
      //     minWidth: imageWidth
      // ),
      child: GestureDetector(
        onTap: () {
          _showBottomSheet();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: imageWidth / 2),
          ],
        ),
      ),
    );
  }

  _showImage(double imageWidth, double imageHeight){
    return Row(
      children: List.generate(_pickedImageList.length, (index){
        return Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: 0.5, color: Color(0xff666666)),
            image: DecorationImage(
              image: FileImage(File(_pickedImageList[index]!.path)),
                fit: BoxFit.fitHeight),
          ),
        );
      })
    );
  }

}




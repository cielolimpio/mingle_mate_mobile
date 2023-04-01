import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/component/app_bar.dart';
import 'package:mingle_mate_mobile/component/elevated_button.dart';
import 'package:mingle_mate_mobile/constants/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MingleMateAppBar(
        appBarTitle: "홈",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                MingleMateElevatedButton(
                    text: "세부 조건으로 검색",
                    buttonColor: PRIMARY_COLOR,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/searchDetails');
                    }),
                MingleMateElevatedButton(
                    text: "프로필 등록하기",
                    buttonColor: PRIMARY_COLOR,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/createProfile');
                    })
              ],
            ),
            Divider(
              height: 16.0,
              thickness: 0,
            ),
            MockData(),
          ],
        ),
      ),
    );
  }
}

class MockData extends StatelessWidget {
  const MockData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> result = [];
    for (var i = 0; i < 8; i++) {
      result.add(i);
    }
    return Column(
        children: List.generate(result.length, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            children: [
              Icon(Icons.face),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name$index", textAlign: TextAlign.right,),
                    Text("Category$index", textAlign: TextAlign.right,),
                  ],
                ),
              )
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
        ]),
      );
    })
        /**
       * TODO
       * api 호출 결과 받아와서 작업 필요
       */

        );
  }
}

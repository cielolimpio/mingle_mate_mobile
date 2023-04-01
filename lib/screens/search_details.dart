import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/component/app_bar.dart';
import 'package:mingle_mate_mobile/component/elevated_button.dart';
import 'package:mingle_mate_mobile/component/icon_button.dart';
import 'package:mingle_mate_mobile/component/radio_button_row.dart';
import 'package:mingle_mate_mobile/component/slider_bar.dart';
import 'package:mingle_mate_mobile/component/text.dart';
import 'package:mingle_mate_mobile/component/text_form_field.dart';
import 'package:mingle_mate_mobile/constants/color.dart';

import '../constants/enum.dart';

class SearchDetailsScreen extends StatefulWidget {
  const SearchDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SearchDetailsScreen> createState() => _SearchDetailsScreenState();
}

class _SearchDetailsScreenState extends State<SearchDetailsScreen> {
  bool studyClicked = false;
  bool sportsClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MingleMateAppBar(appBarTitle: "프로필 세부 검색",),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const MingleMateMainText(text: "성별", verticalPadding: 8.0, horizontalPadding: 8.0),
            MingleMateRadioButtonRow(
                options: [Gender.MALE.korName, Gender.FEMALE.korName]
            ),

            const Divider(
              height: 16.0,
              thickness: 0,
            ),

            const MingleMateMainText(text: "나이", verticalPadding: 8.0, horizontalPadding: 8.0),
            const MingleMateSliderBar(),


            const Divider(
              height: 16.0,
              thickness: 0,
            ),

            const MingleMateMainText(text: "카테고리", verticalPadding: 8.0, horizontalPadding: 8.0),

            Row(
              children: [
                /**
                 * TODO Category DropBox
                 */
              ],
            ),

            const Divider(
              height: 16.0,
              thickness: 0,
            ),

            const MingleMateMainText(text: "주소", verticalPadding: 8.0, horizontalPadding: 8.0),
            /**
             * TODO Address DropBox
             */

            const Divider(
              height: 16.0,
              thickness: 0,
            ),

            MingleMateIconButton(icons: Icons.search, text: "검색", buttonColor: PRIMARY_COLOR, textColor: Colors.white, onPressed: (){})

          ],
        ),
      ),
    );
  }
}

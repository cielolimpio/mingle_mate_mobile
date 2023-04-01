import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/constants/enum.dart';

import '../constants/color.dart';

class MingleMateRadioButtonGender extends StatefulWidget {
  const MingleMateRadioButtonGender({Key? key}) : super(key: key);

  @override
  State<MingleMateRadioButtonGender> createState() => _MingleMateRadioButtonGenderState();
}

class _MingleMateRadioButtonGenderState extends State<MingleMateRadioButtonGender> {
  String _current = Gender.MALE.korName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120.0,
          child: RadioListTile(
              activeColor: PRIMARY_COLOR,
              title: Text(Gender.MALE.korName),
              value: Gender.MALE.korName,
              groupValue: _current,
              onChanged: (value){
                setState(() {
                  _current = value.toString();
                });
              },
            visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity),
            contentPadding: EdgeInsets.all(0),
          ),
        ),
        SizedBox(
          width: 120.0,
          child: RadioListTile(
              activeColor: PRIMARY_COLOR,
              title: Text(Gender.FEMALE.korName),
              value: Gender.FEMALE.korName,
              groupValue: _current,
              onChanged: (value){
                setState(() {
                  _current = value.toString();
                });
              },
            contentPadding: EdgeInsets.all(0),
            visualDensity: VisualDensity(horizontal: VisualDensity.minimumDensity),

          ),
        ),
      ],
    );
  }
}

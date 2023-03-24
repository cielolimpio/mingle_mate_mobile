import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/constants/color.dart';

import '../constants/enum.dart';

class MingleMateRadioButtonPeriod extends StatefulWidget {
  const MingleMateRadioButtonPeriod({Key? key}) : super(key: key);

  @override
  State<MingleMateRadioButtonPeriod> createState() =>
      _MingleMateRadioButtonPeriodState();
}

class _MingleMateRadioButtonPeriodState
    extends State<MingleMateRadioButtonPeriod> {
  String _current = Period.NOMATTER.korName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 120.0,
          child: RadioListTile(
              activeColor: PRIMARY_COLOR,
              contentPadding: EdgeInsets.all(0),
              title: Text(Period.PERIODIC.korName),
              value: Period.PERIODIC.korName,
              groupValue: _current,
              onChanged: (value) {
                setState(() {
                  _current = value.toString();
                });
              }),
        ),
        SizedBox(
          width: 120.0,
          child: RadioListTile(
              activeColor: PRIMARY_COLOR,
              contentPadding: EdgeInsets.all(0),
              title: Text(Period.FREE.korName),
              value: Period.FREE.korName,
              groupValue: _current,
              onChanged: (value) {
                setState(() {
                  _current = value.toString();
                });
              }),
        ),
        SizedBox(
          width: 120.0,
          child: RadioListTile(
              activeColor: PRIMARY_COLOR,
              contentPadding: EdgeInsets.all(0),
              title: Text(Period.NOMATTER.korName),
              value: Period.NOMATTER.korName,
              groupValue: _current,
              onChanged: (value) {
                setState(() {
                  _current = value.toString();
                });
              }),
        )
      ],
    );
  }
}

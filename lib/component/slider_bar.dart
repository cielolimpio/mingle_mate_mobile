import 'package:flutter/material.dart';

class MingleMateSliderBar extends StatefulWidget {
  const MingleMateSliderBar({Key? key}) : super(key: key);

  @override
  State<MingleMateSliderBar> createState() => _MingleMateSliderBarState();
}

class _MingleMateSliderBarState extends State<MingleMateSliderBar> {
  double currentMaxValue = 35.0;
  double currentMinValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RangeSlider(
          min: 0,
          max: 100,
          divisions: 100,
          values: RangeValues(currentMinValue, currentMaxValue),
          labels: RangeLabels(currentMinValue.round().toString(),
              currentMaxValue.round().toString()),
          onChanged: (values) {
            setState(() {
              currentMinValue = values.start;
              currentMaxValue = values.end;
            });
          }),
      Text("${currentMinValue.round().toString()} ~ ${currentMaxValue.round().toString()}")
    ]);
  }
}

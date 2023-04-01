import 'package:flutter/material.dart';
import 'package:mingle_mate_mobile/constants/color.dart';

import '../constants/enum.dart';

class MingleMateRadioButtonRow extends StatefulWidget {
  final List<String> options;

  const MingleMateRadioButtonRow({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  State<MingleMateRadioButtonRow> createState() =>
      _MingleMateRadioButtonRowState();
}

class _MingleMateRadioButtonRowState
    extends State<MingleMateRadioButtonRow> {
  String _current = Period.NOMATTER.korName;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: widget.options.map((option) =>
            SizedBox(
              width: 120.0,
              child: RadioListTile(
                  activeColor: PRIMARY_COLOR,
                  contentPadding: const EdgeInsets.all(0),
                  visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity
                  ),
                  title: Text(option),
                  value: option,
                  groupValue: _current,
                  onChanged: (value) {
                    setState(() {
                      _current = value.toString();
                    });
                  }),
            )).toList()
    );
  }
}

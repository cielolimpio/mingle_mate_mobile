import 'package:flutter/material.dart';

class MingleMateDropdownList extends StatelessWidget {
  final List<String> itemList;

  const MingleMateDropdownList({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 340,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          children: itemList.map((i) => Text(i)).toList(),
        ),
      ),
    );
  }
}

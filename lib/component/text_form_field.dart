import 'package:flutter/material.dart';

class MingleMateTextFormField extends StatelessWidget {
  final String label;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;

  const MingleMateTextFormField({required this.label, required this.onSaved, required this.validator, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),),
          TextFormField(
            decoration: InputDecoration(
                labelText: "$label을(를) 입력해주세요.",
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(
                      width: 0.5,
                      color: Color(0xff666666),
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                )
            ),
            onSaved: onSaved,
            validator: validator,
          ),
          Container(height: 16.0,)
        ],
      ),
    );;
  }
}

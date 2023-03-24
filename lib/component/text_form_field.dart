import 'package:flutter/material.dart';

class MingleMateTextFormField extends StatelessWidget {
  final String label;
  final FormFieldSetter onSaved;
  final Function(String? value) validator;
  String? placeHolder;

  MingleMateTextFormField({required this.label, required this.onSaved, required this.validator, this.placeHolder, Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
            style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: placeHolder == null ? "$label을(를) 입력해주세요." : "$placeHolder",
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
              validator: (value) {
                return validator(value);
              },
            ),
          ),
          Container(height: 16.0,)
        ],
      ),
    );;
  }
}

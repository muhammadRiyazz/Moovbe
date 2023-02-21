import 'package:flutter/material.dart';

class TextFieldlogin extends StatelessWidget {
  const TextFieldlogin({
    super.key,
    required this.controller,
    required this.hindtext,
    required this.mvalue,
  });
  final String hindtext;
  final TextEditingController controller;
  final String mvalue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'required';
        } else if (mvalue != value) {
          return "Enter valid field";
        } else {
          return null;
        }
      },
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.all(20),
          hintText: hindtext,
          filled: true,
          fillColor: Color.fromARGB(255, 227, 222, 222)),
    );
  }
}

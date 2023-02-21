import 'package:flutter/material.dart';

class TextFieldDriveradd extends StatelessWidget {
  const TextFieldDriveradd(
      {super.key, required this.controller, required this.hindtext});
  final String hindtext;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: EdgeInsets.all(18),
          hintText: hindtext,
          filled: true,
          fillColor: const Color.fromARGB(255, 238, 235, 235)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/colors.dart';

class AddDriver extends StatelessWidget {
  AddDriver({super.key});
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController licensecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Driver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFieldDriver(
              controller: namecontroller,
              hindtext: 'Enter Name',
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldDriver(
              controller: licensecontroller,
              hindtext: 'Enter Licence Number',
            ),
            Spacer(),
            TextButton(
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return AddDriver();
                  //   },
                  // ));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 168, 134, 33),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Save',
                    style: TextStyle(color: cwhite),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}

class TextFieldDriver extends StatelessWidget {
  const TextFieldDriver(
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
          contentPadding: EdgeInsets.all(0),
          hintText: hindtext,
          filled: true,
          fillColor: const Color.fromARGB(255, 238, 235, 235)),
    );
  }
}

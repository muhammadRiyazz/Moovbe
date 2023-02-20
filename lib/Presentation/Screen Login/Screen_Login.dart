import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moovbe/Presentation/screen%20home/Screen_home.dart';

import '../../core/colors.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 250,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                TextFieldDriver(
                  hindtext: 'Enter User Name',
                  controller: usernamecontroller,
                ),
                SizedBox(
                  height: 17,
                ),
                TextFieldDriver(
                  hindtext: 'Enter Password',
                  controller: usernamecontroller,
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 168, 134, 33),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    'Log in',
                    style: TextStyle(color: cwhite),
                  )),
                )),
          ),
        ],
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: EdgeInsets.all(20),
          hintText: hindtext,
          filled: true,
          fillColor: Color.fromARGB(255, 227, 222, 222)),
    );
  }
}

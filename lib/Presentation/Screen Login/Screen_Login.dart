// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moovbe/Domain/Api_integration.dart';
import 'package:moovbe/Domain/Modals/modal_loginrspns.dart';
import 'package:moovbe/Presentation/screen%20home/Screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          Stack(
            children: [
              Container(
                color: Colors.black,
                height: 250,
                width: double.infinity,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('asset/img/Polygon 1.png')),
              ),
              Positioned(
                left: 40,
                bottom: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 45,
                          color: cwhite,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Manage Your Bus and Drivers',
                      style: TextStyle(fontSize: 19, color: cwhite),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                TextFieldDriver(
                  hindtext: 'Enter User Name',
                  controller: usernamecontroller,
                ),
                const SizedBox(
                  height: 17,
                ),
                TextFieldDriver(
                  hindtext: 'Enter Password',
                  controller: passwordcontroller,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                onPressed: () async {
                  final Loginrspns data = await Network.login(
                      username: usernamecontroller.text,
                      password: passwordcontroller.text);

                  //await storekey(key: data.urlId, token: data.access);

                  if (data.status == true) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ));
                  } else {
                    log('message');
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 168, 134, 33),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
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

  // storekey({required String key, required String token}) async {
  //   final sharepreferances = await SharedPreferences.getInstance();

  //   sharepreferances.setString('apikey', key);

  //   sharepreferances.setString('token', token);
  // }
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

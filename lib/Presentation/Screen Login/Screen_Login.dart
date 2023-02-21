// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moovbe/Domain/Api_integration.dart';
import 'package:moovbe/Domain/Modals/modal_loginrspns.dart';
import 'package:moovbe/Presentation/Screen%20Add%20Driver/screen_add_Driver.dart';
import 'package:moovbe/Presentation/Screen%20Login/widgets/textfielss.dart';
import 'package:moovbe/Presentation/screen%20home/Screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/colors.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: primeryclr,
                  height: 250,
                  width: double.infinity,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset('asset/img/Polygon 1.png')),
                ),
                Positioned(
                  left: 40,
                  bottom: 40,
                  child: SingleChildScrollView(
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
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  TextFieldlogin(
                    hindtext: 'Enter User Name',
                    controller: usernamecontroller,
                    mvalue: 'admin_user',
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  TextFieldlogin(
                    mvalue: '123admin789',
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
                    if (_formkey.currentState!.validate()) {
                      final Loginrspns data = await Network.login(
                          username: usernamecontroller.text,
                          password: passwordcontroller.text);

                      if (data.status == true) {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ));
                      } else {
                        log('message');
                      }
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: buttonclr,
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
      ),
    );
  }
}

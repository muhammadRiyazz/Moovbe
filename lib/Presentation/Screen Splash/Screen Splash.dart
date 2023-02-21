import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moovbe/Presentation/Screen%20Login/Screen_Login.dart';
import 'package:moovbe/Presentation/screen%20home/Screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/colors.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.red,
        child: Column(
          children: [
            const Spacer(),
            Center(child: Image.asset('asset/img/logo.png')),
            const Spacer(),
            TextButton(
                onPressed: () {
                  gotonext(context: context);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: cwhite, borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.red),
                  )),
                ))
          ],
        ),
      ),
    );
  }

  gotonext({required BuildContext context}) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final apitoken = sharedPreferences.getString('token');
    if (apitoken == null || apitoken.isEmpty) {
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return ScreenLogin();
        },
      ));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ));
    }
  }
}

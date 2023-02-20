import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moovbe/Presentation/Screen%20Login/Screen_Login.dart';

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
            Center(child: Image.asset('lib/assets/img/logo.png')),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ScreenLogin();
                    },
                  ));
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
}

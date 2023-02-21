import 'package:flutter/material.dart';
import 'package:moovbe/core/colors.dart';

import 'Presentation/Screen Splash/Screen Splash.dart';
import 'Presentation/screen home/Screen_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: primeryclr,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 1,
                color: Color.fromARGB(255, 251, 248, 248)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.amberAccent),
          ),
        ),
      ),
      home: const ScreenSplash(),
    );
  }
}

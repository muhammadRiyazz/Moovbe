import 'package:flutter/material.dart';
import 'package:moovbe/Presentation/Screen%20Add%20Driver/screen_add_Driver.dart';
import 'package:moovbe/core/colors.dart';

class AddDriverButton extends StatelessWidget {
  const AddDriverButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddDriver();
            },
          ));
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: buttonclr, borderRadius: BorderRadius.circular(10)),
          child: const Center(
              child: Text(
            'Add Driver',
            style: TextStyle(color: cwhite),
          )),
        ));
  }
}

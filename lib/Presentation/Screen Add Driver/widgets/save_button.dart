import 'package:flutter/material.dart';
import 'package:moovbe/Presentation/screen%20home/Screen_home.dart';
import 'package:moovbe/Presentation/widgets/snackbar.dart';
import 'package:moovbe/core/colors.dart';

import '../../../Domain/functions/oparations.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.licensecontroller,
    required this.namecontroller,
  });

  final TextEditingController licensecontroller;
  final TextEditingController namecontroller;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          await addDriver(
              context: context,
              license: licensecontroller.text,
              name: namecontroller.text);

          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ), (route) => false);
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: buttonclr, borderRadius: BorderRadius.circular(10)),
          child: const Center(
              child: Text(
            'Save',
            style: TextStyle(color: cwhite),
          )),
        ));
  }
}

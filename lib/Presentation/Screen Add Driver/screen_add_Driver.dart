import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moovbe/Domain/Api_integration.dart';
import 'package:moovbe/Domain/functions/oparations.dart';
import 'package:moovbe/Presentation/Screen%20Add%20Driver/widgets/save_button.dart';
import 'package:moovbe/Presentation/Screen%20Add%20Driver/widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/colors.dart';

class AddDriver extends StatefulWidget {
  AddDriver({super.key});

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  final TextEditingController namecontroller = TextEditingController();

  final TextEditingController licensecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Driver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFieldDriveradd(
              controller: namecontroller,
              hindtext: 'Enter Name',
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldDriveradd(
              controller: licensecontroller,
              hindtext: 'Enter Licence Number',
            ),
            const Spacer(),
            SaveButton(
                licensecontroller: licensecontroller,
                namecontroller: namecontroller)
          ],
        ),
      ),
    );
  }
}

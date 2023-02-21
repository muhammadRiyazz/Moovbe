import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moovbe/Domain/Api_integration.dart';
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
        title: Text('Add Driver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFieldDriveradd(
              controller: namecontroller,
              hindtext: 'Enter Name',
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldDriveradd(
              controller: licensecontroller,
              hindtext: 'Enter Licence Number',
            ),
            Spacer(),
            TextButton(
                onPressed: () async {
                  final sharedPreferences =
                      await SharedPreferences.getInstance();
                  final apikey = sharedPreferences.getString('apikey');
                  final apitoken = sharedPreferences.getString('token');

                  await Network.addDriver(
                      apikey: apikey!,
                      mobile: '7034612195',
                      name: namecontroller.text,
                      licenseno: licensecontroller.text,
                      token: apitoken!);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: buttonclr,
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

class TextFieldDriveradd extends StatelessWidget {
  const TextFieldDriveradd(
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
          contentPadding: EdgeInsets.all(18),
          hintText: hindtext,
          filled: true,
          fillColor: const Color.fromARGB(255, 238, 235, 235)),
    );
  }
}

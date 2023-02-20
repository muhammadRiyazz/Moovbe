import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:moovbe/core/colors.dart';

class ScreenBus extends StatelessWidget {
  const ScreenBus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.brown[900],
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 22, bottom: 15, left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rohith Sharma',
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: cwhite),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'License no:PJ515196161655',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: cwhite),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset('lib/assets/img/Driver.png'),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

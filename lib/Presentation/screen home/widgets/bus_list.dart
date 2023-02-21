import 'package:flutter/material.dart';
import 'package:moovbe/core/colors.dart';

import '../../Screen Bus/screen_bus.dart';
import 'dart:math' as math;

class Buslists extends StatelessWidget {
  const Buslists({
    super.key,
    required this.busname,
    required this.seattype,
  });

  final List<String> busname;
  final List<String> seattype;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: busname.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          return Container(
              height: 80,
              decoration: BoxDecoration(
                  color: cwhite, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.black12),
                    height: double.maxFinite,
                    child: Image.asset('asset/img/image 3.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          busname[index],
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 17),
                        ),
                        Text(
                          'Swift Scania P-series',
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        math.Random random = math.Random();
                        int number = random.nextInt(2);

                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ScreenBus(
                              mseatno: seattype[number],
                            );
                          },
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: buttonclr,
                            borderRadius: BorderRadius.circular(7)),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Manage',
                            style: TextStyle(color: cwhite),
                          ),
                        ),
                      ))
                ],
              ));
        },
      ),
    );
  }
}

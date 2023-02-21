import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moovbe/Domain/Api_integration.dart';
import 'package:moovbe/Domain/functions/oparations.dart';
import 'package:moovbe/Presentation/Screen%20Bus/screen_bus.dart';
import 'package:moovbe/Presentation/Screen%20Drivers/screen%20Divers.dart';
import 'package:moovbe/Presentation/screen%20home/widgets/bus_list.dart';
import 'package:moovbe/core/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  final List<String> seattype = ['2*2', '1*3'];
  final List<String> busname = [
    'volvo',
    'KSRTC',
    'Transporst',
    'low floor',
  ];

  @override
  Widget build(BuildContext context) {
    final msize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'asset/img/logo.png',
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 0.25 * msize.height,
                  decoration: BoxDecoration(
                      color: buttonclr,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Bus',
                              style: TextStyle(
                                  color: cwhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27),
                            ),
                            Text(
                              'Manage your bus',
                              style: TextStyle(
                                  color: cwhite,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset('asset/img/image 2.png'))
                    ],
                  ),
                )),
                const SizedBox(
                  width: 17,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () async {
                    final driverlist = await getdata();
                    // ignore: use_build_context_synchronously
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ScreenDrivers(
                          driverlist: driverlist,
                        );
                      },
                    ));
                  },
                  child: Container(
                    height: 0.25 * msize.height,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 28, 24, 11),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Driver',
                                style: TextStyle(
                                    color: cwhite,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27),
                              ),
                              Text(
                                'Manage your Driver',
                                style: TextStyle(
                                    color: cwhite,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            'asset/img/Driver.png',
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '21 Buses Fount',
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Buslists(busname: busname, seattype: seattype),
          ],
        ),
      ),
    );
  }
}

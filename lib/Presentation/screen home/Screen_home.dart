import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moovbe/Domain/Api_integration.dart';
import 'package:moovbe/Presentation/Screen%20Bus/screen_bus.dart';
import 'package:moovbe/Presentation/Screen%20Drivers/screen%20Divers.dart';
import 'package:moovbe/core/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final msize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 48, bottom: 10),
              child: Image.asset(
                'lib/assets/img/logo.png',
                fit: BoxFit.cover,
              ),
            )),
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
                      color: Colors.red[700],
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
                          child: Image.asset('lib/assets/img/image 2.png'))
                    ],
                  ),
                )),
                const SizedBox(
                  width: 17,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () async {
                    log('message');
                    final sharedPreferences =
                        await SharedPreferences.getInstance();

                    final apikey = sharedPreferences.getString('apikey');
                    final apitoken = sharedPreferences.getString('token');

                    //log(apikey!);

                    final respList = await Network.getdriverlist(
                        apikey: apikey!, token: apitoken!);
                    final driverlist = respList.driverList;

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
                            'lib/assets/img/Driver.png',
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                '21 Buses Fount',
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 7,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: cwhite,
                          borderRadius: BorderRadius.circular(10)),
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
                            child: Image.asset('lib/assets/img/image 3.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'KSRTC',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                ),
                                Text(
                                  'Swift Scania P-series',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ScreenBus();
                                  },
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 168, 134, 33),
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
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moovbe/Domain/Api_integration.dart';
import 'package:moovbe/Domain/Modals/modal_Driver.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/colors.dart';
import '../Screen Add Driver/screen_add_Driver.dart';

class ScreenDrivers extends StatefulWidget {
  ScreenDrivers({super.key, required this.driverlist});
  List<DriverList> driverlist;

  @override
  State<ScreenDrivers> createState() => _ScreenDriversState();
}

class _ScreenDriversState extends State<ScreenDrivers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver List')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '${widget.driverlist.length} Drivers Fount',
              style: const TextStyle(
                  color: Colors.black26,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.driverlist.length,
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
                          child: Image.asset('asset/img/Ellipse.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 17),
                          child: SizedBox(
                            width: 160,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.driverlist[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                ),
                                Text(
                                  'license no: ${widget.driverlist[index].licenseNo}',
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        //  const Spacer(),
                        TextButton(
                            onPressed: () async {
                              final sharedPreferences =
                                  await SharedPreferences.getInstance();
                              final apikey =
                                  sharedPreferences.getString('apikey');
                              final apitoken =
                                  sharedPreferences.getString('token');

                              Network.deleteDriver(
                                  apikey: apikey!,
                                  driverid: widget.driverlist[index].id,
                                  token: apitoken!);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: buttonclr,
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(color: cwhite),
                                ),
                              ),
                            ))
                      ],
                    ));
              },
            ),
          ),
          TextButton(
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
              ))
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moovbe/Presentation/Screen%20Bus/Widgets/Driver_part.dart';
import 'package:moovbe/Presentation/Screen%20Bus/Widgets/seat_part.dart';

class ScreenBus extends StatelessWidget {
  const ScreenBus({super.key, required this.mseatno});

  final String mseatno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swift Scania P-series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const DriverPart(),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      //   color:c,
                      border: Border.all(color: Colors.grey)),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('asset/svgimg/Seat.svg',
                            colorFilter: const ColorFilter.mode(
                                Colors.black, BlendMode.srcIn),
                            semanticsLabel: 'A red up arrow'),
                      ),
                      Row(
                        children: [
                          SeatRow(seatno: '2*2' == mseatno ? 2 : 1),
                          const Spacer(),
                          SeatRow(seatno: '2*2' == mseatno ? 2 : 3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moovbe/core/colors.dart';

class ScreenBus extends StatelessWidget {
  const ScreenBus({super.key, required this.mseatno});

  final String mseatno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                      children: const [
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
                  const Spacer(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Image.asset('asset/img/Driver.png'),
                      ))
                ],
              ),
            ),
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

class SeatRow extends StatelessWidget {
  const SeatRow({
    super.key,
    required this.seatno,
  });

  final int seatno;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(seatno, (index) {
        return const SeateColumn();
      }),
    );
  }
}

class SeateColumn extends StatelessWidget {
  const SeateColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(9, (index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            'asset/svgimg/Seat.svg',
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
          ),
        );
      }),
    );
  }
}

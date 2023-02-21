import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moovbe/core/colors.dart';

class DriverPart extends StatelessWidget {
  const DriverPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: primeryclr, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22, bottom: 15, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Rohith Sharma',
                  style: TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w700, color: cwhite),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'License no:PJ515196161655',
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500, color: cwhite),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

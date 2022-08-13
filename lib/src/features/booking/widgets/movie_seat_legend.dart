import 'package:flutter/material.dart';

import '../../../utility/data/mockdata.dart';

class MovieSeatLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: seatTypes
          .map(
            (seatType) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    height: 12,
                    width: 12,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: seatType.color,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Text(seatType.name),
                  )
                ],
              ),
            ),
          )
          .toList(growable: false),
    );
  }
}

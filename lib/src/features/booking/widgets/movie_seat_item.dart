import 'package:flutter/material.dart';

import '../../../models/movies.dart';
import './seat_box.dart';

class MovieSeatItem extends StatelessWidget {
  final List<Seat> seats;
  final bool isFront;

  MovieSeatItem({required this.seats, this.isFront = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: isFront ? 16 : 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (_, index) {
          final seat = seats[index];
          return SeatBox(seat: seat);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../models/movies.dart';
import './movie_seat_item.dart';

class MovieSeats extends StatelessWidget {
  final List<List<Seat>> seats;

  MovieSeats({required this.seats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (int i = 0; i < 3; i++)
              MovieSeatItem(
                seats: seats[i],
                isFront: true,
              ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            for (int i = 3; i < 6; i++)
              MovieSeatItem(
                seats: seats[i],
              ),
          ],
        )
      ],
    );
  }
}

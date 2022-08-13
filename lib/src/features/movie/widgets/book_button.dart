import 'package:flutter/material.dart';
import '../../../utility/constant/constants.dart';
import '../../../models/movies.dart';

import '../../booking/booking_screen.dart';

class BookButton extends StatelessWidget {
  final Movies movie;

  BookButton({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        const transitionDuration = Duration(milliseconds: 200);

        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: transitionDuration,
            reverseTransitionDuration: transitionDuration,
            pageBuilder: (_, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: BookingScreen(movie: movie),
              );
            },
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

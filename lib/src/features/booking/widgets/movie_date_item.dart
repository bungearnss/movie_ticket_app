import 'package:flutter/material.dart';

import '../../../utility/constant/constants.dart';
import '../../../models/movies.dart';

class MovieDateItem extends StatelessWidget {
  final MovieDate date;
  final bool isSelected;

  MovieDateItem({required this.date, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${date.day} ${date.month}',
            style: TextStyle(
                color: isSelected ? Colors.white70 : AppColors.primaryColor),
          ),
          const SizedBox(height: 5),
          Text(
            date.hour,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}

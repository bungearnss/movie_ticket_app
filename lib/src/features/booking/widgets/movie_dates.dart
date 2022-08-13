import 'package:flutter/material.dart';

import '../../../models/movies.dart';
import './movie_date_item.dart';

class MovieDates extends StatefulWidget {
  final List<MovieDate> dates;

  MovieDates({required this.dates});

  @override
  State<MovieDates> createState() => _MovieDatesState();
}

class _MovieDatesState extends State<MovieDates> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(width: 0),
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.dates.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: MovieDateItem(
            date: widget.dates[index],
            isSelected: index == _selectedIndex,
          ),
        );
      },
    );
  }
}

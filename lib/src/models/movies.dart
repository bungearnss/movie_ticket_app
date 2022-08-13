import 'package:flutter/material.dart';

class Movies {
  final String name;
  final String img;
  final String screenPreview;
  final String description;
  final List<String> type;
  final double hours;
  final String director;
  final int stars;
  final List<String> actors;
  final List<MovieDate> dates;
  final List<List<Seat>> seats;

  Movies({
    required this.name,
    required this.img,
    required this.screenPreview,
    required this.description,
    required this.type,
    required this.hours,
    required this.director,
    required this.stars,
    required this.actors,
    required this.dates,
    required this.seats,
  });
}

class MovieDate {
  final int day;
  final String month;
  final String hour;

  MovieDate({required this.day, required this.month, required this.hour});
}

class Seat {
  final bool isHidden;
  final bool isOcuppied;
  bool isSelected;

  Seat(
      {required this.isHidden,
      required this.isOcuppied,
      this.isSelected = false});
}

class SeatType {
  final String name;
  final Color color;

  SeatType({required this.name, required this.color});
}

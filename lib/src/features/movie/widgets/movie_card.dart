import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String img;

  MovieCard({required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(70),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 20),
            color: Colors.black.withOpacity(0.15),
          ),
        ],
        image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
      ),
    );
  }
}

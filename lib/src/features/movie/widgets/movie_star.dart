import 'package:flutter/material.dart';

class MovieStar extends StatelessWidget {
  final int stars;

  MovieStar({required this.stars});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < stars; i++)
          const Icon(Icons.star, color: Colors.amber)
      ],
    );
  }
}

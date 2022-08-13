import 'package:flutter/material.dart';

import '../../../utility/constant/constants.dart';
import '../../../models/movies.dart';

class MovieInfo extends StatelessWidget {
  final Movies movie;

  MovieInfo({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Hour", style: TextStyles.infoTitleStyle),
          ),
          Text("${movie.hours} hour")
        ],
      ),
      Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Director", style: TextStyles.infoTitleStyle),
          ),
          Text(movie.director)
        ],
      ),
    ]);
  }
}

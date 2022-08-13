import 'package:flutter/material.dart';
import 'package:movie_ticket_purchase_app/src/features/movie/animation/opacity_tween.dart';
import 'package:movie_ticket_purchase_app/src/features/movie/animation/slide_up_tween.dart';

import '../../utility/constant/constants.dart';
import '../../models/movies.dart';

import './widgets/movie_card.dart';
import './widgets/movie_star.dart';
import './widgets/movie_Info.dart';
import './widgets/book_button.dart';

class MovieScreen extends StatelessWidget {
  final Movies movie;

  MovieScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mWidth = constraints.maxWidth;
        final mHeight = constraints.maxHeight;

        return Scaffold(
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                top: -mHeight * 0.1,
                height: mHeight * 0.6,
                width: mWidth,
                child: Hero(
                  tag: movie.img,
                  child: MovieCard(img: movie.img),
                ),
              ),
              Positioned(
                top: -mHeight * 0.44,
                left: 15,
                height: mHeight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
              Positioned(
                width: mWidth,
                height: mHeight * 0.5,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Hero(
                      tag: movie.name,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text(
                          movie.name.toUpperCase(),
                          style: TextStyles.movieNameTextStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    OpacityTween(
                      begin: 0.0,
                      child: SlideUpTween(
                        begin: const Offset(-30, 30),
                        child: MovieStar(stars: movie.stars),
                      ),
                    ),
                    const Spacer(),
                    OpacityTween(
                      child: SlideUpTween(
                        begin: const Offset(0, 200),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                          child: Text(
                            movie.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 7,
                            style: TextStyles.movieeDescriptionStyle,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    OpacityTween(
                      child: SlideUpTween(
                        begin: const Offset(0, 200),
                        duration: const Duration(milliseconds: 850),
                        child: MovieInfo(movie: movie),
                      ),
                    ),
                    const Spacer(flex: 5),
                  ],
                ),
              ),
              Positioned(
                bottom: mHeight * 0.02,
                height: mHeight * 0.06,
                width: mWidth * 0.7,
                child: OpacityTween(
                  child: SlideUpTween(
                    begin: const Offset(-30, 60),
                    child: BookButton(movie: movie),
                  ),
                ),
              ),
              Positioned(
                bottom: mHeight * 0.04,
                child: OpacityTween(
                  child: SlideUpTween(
                    begin: const Offset(-0, 60),
                    child: const IgnorePointer(
                      child: Text(
                        "Book Ticket",
                        style: TextStyles.bookButtonTextStyle,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

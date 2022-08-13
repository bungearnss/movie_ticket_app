import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import '../../../utility/data/mockdata.dart';
import '../../../utility/constant/constants.dart';

import '../../movie/movie_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final PageController _movieCardPageController;
  late final PageController _movieDetailPageController;

  double _movieCardPage = 0.0;
  double _movieDetailPage = 0.0;
  int _movieCardIndex = 0;
  final _showMovieDetail = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _movieCardPageController = PageController(viewportFraction: 0.77)
      ..addListener(_movieCardPagePercentListener);
    _movieDetailPageController = PageController()
      ..addListener(_movieDetailPagePercentListener);
  }

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
    });
  }

  _movieDetailPagePercentListener() {
    setState(() {
      _movieDetailPage = _movieDetailPageController.page!;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _movieCardPageController
      ..removeListener(_movieCardPagePercentListener)
      ..dispose();

    _movieDetailPageController
      ..removeListener(_movieDetailPagePercentListener)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final mHeight = constraints.maxHeight;
      final mWidth = constraints.maxWidth;

      return Column(
        children: [
          const Spacer(),
          SizedBox(
            height: mHeight * 0.7,
            child: PageView.builder(
              controller: _movieCardPageController,
              clipBehavior: Clip.none,
              itemCount: movies.length,
              onPageChanged: (page) {
                _movieDetailPageController.animateToPage(
                  page,
                  duration: const Duration(microseconds: 500),
                  curve: const Interval(0.25, 1, curve: Curves.decelerate),
                );
              },
              itemBuilder: (_, index) {
                final item = movies[index];
                final progress = (_movieCardPage - index);
                final scale = ui.lerpDouble(1, 0.8, progress.abs())!;
                final isCurrentPage = index == _movieCardIndex;
                final isScrolling =
                    _movieCardPageController.position.isScrollingNotifier.value;
                final isFirstPage = index == 0;

                return Transform.scale(
                  alignment: Alignment.lerp(
                    Alignment.bottomLeft,
                    Alignment.center,
                    -progress,
                  ),
                  scale: isScrolling && isFirstPage ? 1 - progress : scale,
                  child: GestureDetector(
                    onTap: () {
                      _showMovieDetail.value = !_showMovieDetail.value;
                      const transitionDuration = Duration(microseconds: 550);
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          transitionDuration: transitionDuration,
                          reverseTransitionDuration: transitionDuration,
                          pageBuilder: (_, animation, __) {
                            return FadeTransition(
                              opacity: animation,
                              child: MovieScreen(movie: item),
                            );
                          },
                        ),
                      );
                      Future.delayed(transitionDuration, () {
                        _showMovieDetail.value = !_showMovieDetail.value;
                      });
                    },
                    child: Hero(
                      tag: item.img,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        transform: Matrix4.identity()
                          ..translate(
                            isCurrentPage ? 0.0 : -20.0,
                            isCurrentPage ? 0.0 : 60.0,
                          ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(40),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 25,
                              offset: const Offset(0, 25),
                              color: Colors.black.withOpacity(0.15),
                            ),
                          ],
                          image: DecorationImage(
                            image: NetworkImage(item.img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          SizedBox(
            height: mHeight * 0.25,
            child: PageView.builder(
              controller: _movieDetailPageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: movies.length,
              itemBuilder: (_, index) {
                final item = movies[index];
                final opacity = (index - _movieDetailPage).clamp(0.0, 1.0);

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: mWidth * 0.05),
                  child: Opacity(
                    opacity: 1 - opacity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: item.name,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              item.name.toUpperCase(),
                              style: TextStyles.movieNameTextStyle,
                            ),
                          ),
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: _showMovieDetail,
                          builder: (_, value, __) {
                            return Visibility(
                              visible: value,
                              child: Text(
                                "BY ${item.actors.join(', ')}",
                                style: TextStyles.movieDetails,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: mWidth,
                          height: 35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: item.type.length,
                            itemBuilder: (ctx, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 7),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.primaryColor,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 3,
                                ),
                                child: Text(
                                  item.type[index],
                                  style: TextStyles.bookButtonTextStyle,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      );
    });
  }
}

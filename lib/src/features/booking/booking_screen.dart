import 'package:flutter/material.dart';
import 'package:movie_ticket_purchase_app/src/utility/data/mockdata.dart';

import '../../utility/constant/constants.dart';
import '../../models/movies.dart';

import './animation/booking_animation_controller.dart';
import './animation/custom_animated_opacity.dart';
import './widgets/movie_dates.dart';
import './widgets/movie_teather.dart';
import './widgets/movie_seat_legend.dart';
import './widgets/movie_seats.dart';

import '../verification/verification_screen.dart';

class BookingScreen extends StatefulWidget {
  final Movies movie;

  BookingScreen({required this.movie});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with TickerProviderStateMixin {
  late final BookingPageAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = BookingPageAnimationController(
      buttonController: AnimationController(
          duration: const Duration(milliseconds: 750), vsync: this),
      contentController: AnimationController(
          duration: const Duration(milliseconds: 750), vsync: this),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.buttonController.forward();
      await _controller.buttonController.reverse();
      await _controller.contentController.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final mWidth = constraints.maxWidth;
      final mHeight = constraints.maxHeight;

      return Scaffold(
        backgroundColor: AppColors.primaryColor.withOpacity(0.7),
        extendBodyBehindAppBar: true,
        appBar: appBar(widget.movie.name),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              width: mWidth,
              height: mHeight * 0.9,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    /*  CustomAnimatedOpacity(
                      animation: _controller.topOpacityAnimation,
                      child: SizedBox(
                        height: mHeight * 0.075,
                        child: MovieDates(dates: widget.movie.dates),
                      ),
                    ), */
                    const Spacer(),
                    CustomAnimatedOpacity(
                      animation: _controller.topOpacityAnimation,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        height: mHeight * 0.2,
                        width: mWidth,
                        child: MovieTeather(
                          img: widget.movie.img,
                          maxHeight: mHeight,
                          maxWidth: mWidth,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mHeight * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomAnimatedOpacity(
                        animation: _controller.bottomOpacityAnimation,
                        child: MovieSeats(seats: widget.movie.seats),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomAnimatedOpacity(
                        animation: _controller.bottomOpacityAnimation,
                        child: MovieSeatLegend(),
                      ),
                    ),
                    const Spacer(),
                    CustomAnimatedOpacity(
                      animation: _controller.bottomOpacityAnimation,
                      child: Container(
                        width: mWidth,
                        height: mHeight * 0.3,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.location_on_sharp,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Central World Cineplex",
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: mHeight * 0.075,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                child: MovieDates(dates: widget.movie.dates),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              child: GestureDetector(
                onTap: () {
                  const transitionDuration = Duration(milliseconds: 400);

                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: transitionDuration,
                      reverseTransitionDuration: transitionDuration,
                      pageBuilder: (_, animation, __) {
                        return FadeTransition(
                          opacity: animation,
                          child: VerificationScreen(),
                        );
                      },
                    ),
                  );
                },
                child: AnimatedBuilder(
                  animation: _controller.buttonController,
                  builder: (_, child) {
                    final size = _controller
                        .buttonSizeAnimation(
                          Size(mWidth * 0.7, mHeight * 0.06),
                          Size(mWidth * 1.2, mHeight * 1.1),
                        )
                        .value;
                    final margin =
                        _controller.buttonMarginAnimation(mHeight * 0.03).value;
                    return Container(
                      width: size.width,
                      height: size.height,
                      margin: EdgeInsets.only(bottom: margin),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: mHeight * 0.07,
              child: const IgnorePointer(
                child: Text(
                  "Buy Ticket",
                  style: TextStyles.bookButtonTextStyle,
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  PreferredSize? appBar(String title) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: CustomAnimatedOpacity(
        animation: _controller.topOpacityAnimation,
        child: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 22,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

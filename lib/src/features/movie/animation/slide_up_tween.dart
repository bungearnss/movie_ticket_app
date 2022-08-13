import 'package:flutter/material.dart';

class SlideUpTween extends StatelessWidget {
  final Offset begin;
  final Curve curve;
  final Duration duration;
  final Widget child;

  SlideUpTween({
    required this.begin,
    this.curve = Curves.easeOut,
    this.duration = const Duration(milliseconds: 750),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: const Offset(0, 0)),
      duration: duration,
      curve: curve,
      builder: (_, value, child) {
        return Transform.translate(offset: value, child: child);
      },
      child: child,
    );
  }
}

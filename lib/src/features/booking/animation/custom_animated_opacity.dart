import 'package:flutter/material.dart';

class CustomAnimatedOpacity extends AnimatedWidget {
  const CustomAnimatedOpacity({
    Key? key,
    required Animation animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  final Widget child;

  Animation<double> get progess => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: progess.value,
      child: child,
    );
  }
}

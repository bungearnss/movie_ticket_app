import 'package:flutter/material.dart';
import 'package:movie_ticket_purchase_app/src/features/verification/widgets/face_id_painter.dart';

import './animation/face_id_animation.dart';

class VerificationScreen extends StatefulWidget {
  final double customPaintSize;

  VerificationScreen({this.customPaintSize = 200.0});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  late final FaceIDAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FaceIDAnimationController(
      controller: AnimationController(
        duration: const Duration(seconds: 4),
        vsync: this,
      ),
      customPaintSize: widget.customPaintSize,
    );
    Future.delayed(
      const Duration(seconds: 1),
      () => _controller.forward().then(
            (_) => Navigator.of(context).pop(),
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          size: Size(
            widget.customPaintSize,
            widget.customPaintSize,
          ),
          painter: FaceIDPainter(animation: _controller),
        ),
      ),
    );
  }
}

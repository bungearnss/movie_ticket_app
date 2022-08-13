import 'package:flutter/material.dart';

class MovieTeather extends StatelessWidget {
  final String img;
  final double maxWidth;
  final double maxHeight;

  MovieTeather({
    required this.img,
    required this.maxHeight,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(0.8),
          transformAlignment: Alignment.topCenter,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(img),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: maxHeight * 0.025,
          height: maxHeight * 0.03,
          width: maxWidth * 0.5,
          child: CustomPaint(
            painter: MovieScreenLinePainter(),
          ),
        )
      ],
    );
  }
}

class MovieScreenLinePainter extends CustomPainter {
  MovieScreenLinePainter();
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    final h = size.height;
    final w = size.width;

    final path = Path()
      ..moveTo(0, h)
      ..quadraticBezierTo(w * 0.44, h * 0.57, w * 0.5, h * 0.6)
      ..quadraticBezierTo(w * 0.56, h * 0.57, w, h);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

import 'package:flutter/material.dart';

// Custom clipper for arch shape
class ArchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(
      size.width / 2, 0,
      size.width, size.height * 0.35,
    );
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Painter for arch border
class ArchBorderPainter extends CustomPainter {
  final Color borderColor;
  final double borderWidth;

  ArchBorderPainter({this.borderColor = Colors.black, this.borderWidth = 3});

  @override
  void paint(Canvas canvas, Size size) {
    final path = ArchClipper().getClip(size);
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

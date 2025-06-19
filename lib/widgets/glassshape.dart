import 'dart:ui';
import 'package:flutter/material.dart';

class GlassShapesWidget extends StatelessWidget {
  const GlassShapesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing based on available width
        double baseSize = constraints.maxWidth < 400
            ? constraints.maxWidth
            : 350;
        double mainSquare = baseSize * 0.51;
        double circle = baseSize * 0.25;
        double capsuleW = baseSize * 0.3;
        double capsuleH = baseSize * 0.4;
        double offset = baseSize * 0.27;

        return SizedBox(
          width: baseSize,
          height: baseSize,
          child: Stack(
            children: [
              // Main rounded square
              Positioned(
                left: offset,
                top: offset,
                child: GlassContainer(
                  width: mainSquare,
                  height: mainSquare,
                  borderRadius: BorderRadius.circular(baseSize * 0.14),
                ),
              ),
              // Top right circle
              Positioned(
                right: 0,
                top: 0,
                child: GlassContainer(
                  width: circle,
                  height: circle,
                  borderRadius: BorderRadius.circular(circle / 2),
                ),
              ),
              // Bottom left circle
              Positioned(
                left: 0,
                bottom: offset,
                child: GlassContainer(
                  width: circle,
                  height: circle,
                  borderRadius: BorderRadius.circular(circle / 2),
                ),
              ),
              // Bottom right capsule
              Positioned(
                right: 0,
                bottom: 0,
                child: GlassContainer(
                  width: capsuleW,
                  height: capsuleH,
                  borderRadius: BorderRadius.circular(capsuleH / 2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class GlassContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const GlassContainer({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white.withOpacity(0.15),
            border: Border.all(
              color: Colors.black.withOpacity(0.4),
              width: 1.5,
            ),
          ),

          child: Image.asset(
            'assets/profile.png', // Placeholder for glass effect image
            fit: BoxFit.cover,
            color: Colors.white.withOpacity(0.8),
            colorBlendMode: BlendMode.modulate,
        ),
      ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({required this.imagePath, super.key});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(imagePath, fit: BoxFit.cover),
        // Gradient overlay
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.5, 1.0],
              colors: [
                Colors.black.withValues(alpha: 0.55),
                Colors.transparent,
                Colors.black.withValues(alpha: 0.15),
              ],
            ),
          ),
        ),
        // Carousel dots
        Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 22,
                height: 7,
                decoration: BoxDecoration(
                  color: AppColors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 6),
              _dot(),
              const SizedBox(width: 6),
              _dot(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dot() => Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.65),
          shape: BoxShape.circle,
        ),
      );
}

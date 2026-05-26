import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class TravelerBubble extends StatelessWidget {
  const TravelerBubble({required this.children, this.extraCount, super.key});

  final List<Widget> children;
  final int? extraCount;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.darkBadge,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...children,
            if (extraCount != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  '$extraCount',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class InitialAvatar extends StatelessWidget {
  const InitialAvatar({required this.initial, required this.color, super.key});

  final String initial;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Text(
        initial,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class ImageAvatar extends StatelessWidget {
  const ImageAvatar({
    required this.imagePath,
    this.alignment = Alignment.center,
    super.key,
  });

  final String imagePath;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Image.asset(imagePath, fit: BoxFit.cover, alignment: alignment),
    );
  }
}

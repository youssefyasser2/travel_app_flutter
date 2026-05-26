import 'package:flutter/material.dart';


class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.isFavorite,
    this.onTap,
    this.size = 32,
    super.key,
  });

  final bool isFavorite;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Center(
            child: Icon(
              isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: isFavorite ? const Color(0xFFEA4335) : const Color(0xFF17151F),
              size: size * 0.55,
            ),
          ),
        ),
      ),
    );
  }
}

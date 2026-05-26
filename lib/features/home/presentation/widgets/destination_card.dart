import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/favorite_button.dart';
import '../../models/destination.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({
    required this.destination,
    this.isFavorite,
    this.onTap,
    this.onFavoriteTap,
    super.key,
  });

  final Destination destination;
  final bool? isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    final favorite = isFavorite ?? destination.isFavorite;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 156 / 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: _DestinationImage(
                      destination.imagePath,
                      alignment: Alignment(0, destination.imageAlignmentY),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 8,
                    child: FavoriteButton(
                      isFavorite: favorite,
                      onTap: onFavoriteTap,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              destination.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.cardTitle,
            ),
            const SizedBox(height: 7),
            Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: Color(0xFF9EA2AB),
                  size: 14,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    destination.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.small,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                Text(destination.price, style: AppTextStyles.price),
                const Spacer(),
                const Icon(Icons.star_rounded, color: AppColors.gold, size: 16),
                const SizedBox(width: 3),
                Flexible(
                  child: Text(
                    '${destination.rating.toStringAsFixed(1)} (${destination.reviewCount})',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.small.copyWith(
                      color: const Color(0xFF6F737C),
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DestinationImage extends StatelessWidget {
  const _DestinationImage(this.imagePath, {required this.alignment});

  final String imagePath;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    if (imagePath.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        alignment: alignment,
      );
    }

    return Image.asset(
      imagePath,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      alignment: alignment,
    );
  }
}

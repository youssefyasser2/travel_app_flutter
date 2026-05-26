import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/favorite_button.dart';
import 'review_card.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    required this.title,
    required this.location,
    required this.isFavorite,
    required this.onFavoriteTap,
    this.rating,
    this.reviewCount,
    super.key,
  });

  final String title;
  final String location;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final double? rating;
  final int? reviewCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(44)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    height: 1.15,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F4F6),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: FavoriteButton(
                    isFavorite: isFavorite,
                    onTap: onFavoriteTap,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.location_on_rounded,
                color: AppColors.textSecondary,
                size: 15,
              ),
              const SizedBox(width: 3),
              Text(location, style: AppTextStyles.small),
              const SizedBox(width: 16),
              const Icon(Icons.star_rounded, color: AppColors.gold, size: 16),
              const SizedBox(width: 3),
              if (rating != null && reviewCount != null)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${rating!.toStringAsFixed(1)} ',
                        style: const TextStyle(
                          color: AppColors.gold,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '($reviewCount Reviews)',
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 28),
          const Text(
            'Details',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Tortor ac leo lorem nisl. Viverra vulputate sodales quis et '
            'dui, lacus. Iaculis eu egestas leo egestas vel. Ultrices ut '
            'magna nulla facilisi commodo enim, orci feugiat pharetra. '
            'Id sagittis, ullamcorper turpis ultrices platea pharetra.',
            style: TextStyle(
              fontSize: 14,
              height: 1.65,
              color: Color(0xFF4A4B56),
            ),
          ),
          const SizedBox(height: 28),
          _buildReviewsHeader(),
          const SizedBox(height: 16),
          const ReviewCard(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildReviewsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Reviews',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: AppColors.teal,
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text(
            'See all',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

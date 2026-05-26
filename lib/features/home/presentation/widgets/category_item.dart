import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../models/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  final Category category;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFF8F8FD),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              category.iconPath,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            category.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.caption.copyWith(
              color: isSelected ? AppColors.teal : const Color(0xFF787B84),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

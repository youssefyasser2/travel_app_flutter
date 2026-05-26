import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_assets.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    required this.controller,
    this.onChanged,
    this.onFilterPressed,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(22),
        ),
        child: SizedBox(
          height: 56,
          child: Row(
            children: [
              const _SearchPrefix(),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  textInputAction: TextInputAction.search,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    isCollapsed: true,
                    hintStyle: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _SearchFilterButton(onPressed: onFilterPressed),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchPrefix extends StatelessWidget {
  const _SearchPrefix();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 9),
      child: Icon(Icons.search, color: AppColors.textSecondary, size: 21),
    );
  }
}

class _SearchFilterButton extends StatelessWidget {
  const _SearchFilterButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          height: 28,
          child: VerticalDivider(
            color: AppColors.border,
            thickness: 1,
            width: 1,
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
          onPressed: onPressed,
          constraints: const BoxConstraints.tightFor(width: 32, height: 32),
          padding: EdgeInsets.zero,
          tooltip: 'Filter',
          icon: SvgPicture.asset(
            AppAssets.filterIcon,
            width: 18,
            height: 18,
            colorFilter: const ColorFilter.mode(
              Color(0xFF17151F),
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

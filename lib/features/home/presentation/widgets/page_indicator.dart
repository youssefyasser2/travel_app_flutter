import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.activeIndex,
    required this.count,
    super.key,
  });

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < count; index++) ...[
          _IndicatorDot(isActive: index == activeIndex.clamp(0, count - 1)),
          if (index != count - 1) const SizedBox(width: 6),
        ],
      ],
    );
  }
}

class _IndicatorDot extends StatelessWidget {
  const _IndicatorDot({this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.teal : AppColors.border,
        borderRadius: BorderRadius.circular(99),
      ),
    );
  }
}

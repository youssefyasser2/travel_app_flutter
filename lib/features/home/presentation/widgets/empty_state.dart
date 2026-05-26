import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.hasActiveFilter,
    required this.onClear,
    super.key,
  });

  final bool hasActiveFilter;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.surfaceSoft,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              hasActiveFilter ? 'No trips found' : 'No trips yet',
              style: AppTextStyles.cardTitle,
            ),
            const SizedBox(height: 8),
            Text(
              hasActiveFilter
                  ? 'Try another search or clear the filters.'
                  : 'New trips will appear here.',
              textAlign: TextAlign.center,
              style: AppTextStyles.small,
            ),
            if (hasActiveFilter) ...[
              const SizedBox(height: 12),
              TextButton(
                onPressed: onClear,
                style: TextButton.styleFrom(foregroundColor: AppColors.teal),
                child: const Text('Clear'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

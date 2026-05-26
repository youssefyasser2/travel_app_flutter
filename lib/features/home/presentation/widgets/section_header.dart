import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    required this.trailing,
    super.key,
  });

  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
      child: Row(
        children: [
          Expanded(child: Text(title, style: AppTextStyles.sectionTitle)),
          trailing,
        ],
      ),
    );
  }
}

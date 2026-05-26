import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../constants/app_constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.trailing,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.buttonHeight,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(label, style: AppTextStyles.button),
            if (trailing != null)
              Align(alignment: Alignment.centerRight, child: trailing),
          ],
        ),
      ),
    );
  }
}

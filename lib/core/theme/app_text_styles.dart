import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  const AppTextStyles._();

  static const TextStyle heading = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 28,
    fontWeight: FontWeight.w900,
    height: 1.15,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle button = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    letterSpacing: 0.1,
  );

  static const TextStyle link = TextStyle(
    color: AppColors.teal,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle caption = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle sectionTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w900,
    height: 1.2,
  );

  static const TextStyle cardTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const TextStyle small = TextStyle(
    color: AppColors.textSecondary,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static const TextStyle price = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 15,
    fontWeight: FontWeight.w800,
    height: 1.2,
  );
}

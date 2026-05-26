import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';

class OnboardingHero extends StatelessWidget {
  const OnboardingHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Image.asset(
        AppAssets.onboardingImage,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    );
  }
}

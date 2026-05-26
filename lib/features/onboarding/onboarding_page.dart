import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/primary_button.dart';
import 'widgets/onboarding_hero.dart';
import '../home/presentation/home_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: const [
          OnboardingHero(),
          Expanded(flex: 2, child: OnboardingContent()),
        ],
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.pagePadding,
        22,
        AppConstants.pagePadding,
        28,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'We are here to make your\nholiday easier',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading,
          ),
          const SizedBox(height: 12),
          const Text(
            'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
            textAlign: TextAlign.center,
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            label: 'Get Started',
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute<void>(builder: (_) => const HomePage())),
          ),
          const SizedBox(height: 24),
          const _RegisterPrompt(),
        ],
      ),
    );
  }
}

class _RegisterPrompt extends StatelessWidget {
  const _RegisterPrompt();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.caption.copyWith(
          color: const Color(0xFF17151F),
          fontWeight: FontWeight.w600,
        ),
        children: [
          const TextSpan(text: "Don't have an account? "),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Register',
                style: AppTextStyles.link.copyWith(
                  color: const Color(0xFF00A99D),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

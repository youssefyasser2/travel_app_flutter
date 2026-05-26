import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/constants/app_assets.dart';

class UserGreetingHeader extends StatelessWidget {
  const UserGreetingHeader({this.onNotificationsPressed, super.key});

  final VoidCallback? onNotificationsPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
      child: Row(
        children: [
          const _ProfileAvatar(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hi, Andy', style: AppTextStyles.sectionTitle),
                const SizedBox(height: 3),
                Row(
                  children: const [
                    Icon(Icons.location_on_rounded, color: Color(0xFF9EA2AB), size: 15),
                    SizedBox(width: 3),
                    Text('Netherlands', style: AppTextStyles.small),
                  ],
                ),
              ],
            ),
          ),
          _NotificationButton(onPressed: onNotificationsPressed),
        ],
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Color(0xFFF9B59E),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        AppAssets.userAvatar,
        width: 44,
        height: 44,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.border),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          IconButton(
            onPressed: onPressed,
            constraints: const BoxConstraints.tightFor(width: 46, height: 46),
            padding: EdgeInsets.zero,
            tooltip: 'Notifications',
            icon: SvgPicture.asset(
              AppAssets.notificationIcon,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Color(0xFF17151F),
                BlendMode.srcIn,
              ),
            ),
          ),
          Positioned(
            top: 11,
            right: 12,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.teal,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

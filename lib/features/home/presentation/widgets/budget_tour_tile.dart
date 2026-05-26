import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../models/budget_tour.dart';

class BudgetTourTile extends StatelessWidget {
  const BudgetTourTile({required this.tour, this.onTap, super.key});

  final BudgetTour tour;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 86,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  tour.imagePath,
                  width: 86,
                  height: 86,
                  fit: BoxFit.cover,
                  alignment: Alignment(0, tour.imageAlignmentY),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tour.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cardTitle,
                    ),
                    const SizedBox(height: 4),
                    Text(tour.duration, style: AppTextStyles.small),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: Color(0xFF9EA2AB),
                          size: 15,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            tour.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.small,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text.rich(
                TextSpan(
                  text: tour.price,
                  style: AppTextStyles.price.copyWith(fontSize: 18),
                  children: const [
                    TextSpan(
                      text: '/Person',
                      style: TextStyle(
                        color: Color(0xFF9EA2AB),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

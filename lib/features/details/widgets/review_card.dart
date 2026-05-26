import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFF3F4F6),
          ),
          child: ClipOval(
            child: SvgPicture.asset(
              'assets/icons/Image.svg',
              fit: BoxFit.cover,
              placeholderBuilder: (context) => const Icon(
                Icons.person,
                color: Color(0xFF64748B),
                size: 24,
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Jhone Kenoady',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '23 Nov 2022',
                    style: TextStyle(
                      color: Color(0xFF9CA3AF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: List.generate(
                  5,
                  (index) => const Icon(
                    Icons.star_rounded,
                    color: Color(0xFFFFD700),
                    size: 15,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Amet minim mollit non deserunt ullamco est sit '
                'aliqua dolor do amet sint. Velit officia consequat '
                'duis enim velit mollit.',
                style: TextStyle(
                  color: Color(0xFF4A4B56),
                  fontSize: 13,
                  height: 1.55,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

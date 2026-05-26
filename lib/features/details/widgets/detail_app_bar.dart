import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({required this.onBackPressed, super.key});

  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: topPadding + 8, left: 16, right: 16),
      child: Row(
        children: [
          // Back button
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.25),
                  width: 1,
                ),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: onBackPressed,
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'Vacation Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.2,
              ),
            ),
          ),
          // Spacer to balance the back button
          const SizedBox(width: 42),
        ],
      ),
    );
  }
}

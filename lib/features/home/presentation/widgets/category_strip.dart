import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../models/category.dart';
import 'category_item.dart';

class CategoryStrip extends StatelessWidget {
  const CategoryStrip({
    required this.categories,
    required this.onSelected,
    this.selectedIndex,
    super.key,
  });

  final List<Category> categories;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
      child: Row(
        children: [
          for (var index = 0; index < categories.length; index++) ...[
            Expanded(
              child: CategoryItem(
                category: categories[index],
                isSelected: selectedIndex == index,
                onTap: () => onSelected(index),
              ),
            ),
            if (index != categories.length - 1) const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }
}

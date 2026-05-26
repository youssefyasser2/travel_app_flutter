import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../models/budget_tour.dart';
import '../models/destination.dart';
import 'widgets/budget_tour_tile.dart';
import 'widgets/category_strip.dart';
import 'widgets/destination_card.dart';
import 'widgets/empty_state.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/page_indicator.dart';
import 'widgets/section_header.dart';
import 'widgets/user_greeting_header.dart';
import 'controller/home_controller.dart';
import '../../details/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
    _searchController = TextEditingController();
    _controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onControllerChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final destinations = _controller.filteredDestinations;
    final budgetTours = _controller.visibleBudgetTours;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverToBoxAdapter(
              child: UserGreetingHeader(
                onNotificationsPressed: () => _showSnackBar('No new notifications right now'),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: HomeSearchBar(
                controller: _searchController,
                onChanged: _controller.setQuery,
                onFilterPressed: _controller.toggleFavoriteFilter,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(
              child: CategoryStrip(
                categories: _controller.categories,
                selectedIndex: _controller.selectedCategoryIndex,
                onSelected: _controller.selectCategory,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 28)),
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'Frequently visited',
                trailing: PageIndicator(
                  activeIndex: _controller.visitedPageIndex,
                  count: (destinations.length / 2).ceil(),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            _buildVisitedSection(destinations),
            const SliverToBoxAdapter(child: SizedBox(height: 28)),
            SliverToBoxAdapter(
              child: SectionHeader(
                title: 'On Budget Tour',
                trailing: _buildSeeAllButtons(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            _buildBudgetToursSection(budgetTours),
            const SliverToBoxAdapter(child: SizedBox(height: 28)),
          ],
        ),
      ),
    );
  }

  Widget _buildVisitedSection(List<Destination> destinations) {
    if (destinations.isEmpty) {
      return SliverToBoxAdapter(
        child: EmptyState(
          hasActiveFilter: _controller.hasActiveFilter,
          onClear: () {
            _controller.clearFilters();
            _searchController.clear();
          },
        ),
      );
    }

    return SliverToBoxAdapter(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = (constraints.maxWidth - (AppConstants.pagePadding * 2) - 16) / 2;
          final itemHeight = itemWidth * (238 / 156);
          return SizedBox(
            height: itemHeight + 2,
            child: PageView.builder(
              onPageChanged: _controller.setVisitedPageIndex,
              itemCount: (destinations.length / 2).ceil(),
              itemBuilder: (context, pageIndex) {
                final firstIndex = pageIndex * 2;
                final secondIndex = firstIndex + 1;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
                  child: Row(
                    children: [
                      Expanded(
                        child: DestinationCard(
                          destination: destinations[firstIndex],
                          isFavorite: _controller.isFavorite(destinations[firstIndex].title),
                          onFavoriteTap: () => _controller.toggleFavorite(destinations[firstIndex].title),
                          onTap: () => _openDetails(destinations[firstIndex]),
                        ),
                      ),
                      const SizedBox(width: 16),
                      if (secondIndex < destinations.length)
                        Expanded(
                          child: DestinationCard(
                            destination: destinations[secondIndex],
                            isFavorite: _controller.isFavorite(destinations[secondIndex].title),
                            onFavoriteTap: () => _controller.toggleFavorite(destinations[secondIndex].title),
                            onTap: () => _openDetails(destinations[secondIndex]),
                          ),
                        )
                      else
                        const Expanded(child: SizedBox.shrink()),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildBudgetToursSection(List<BudgetTour> budgetTours) {
    if (budgetTours.isEmpty) {
      return SliverToBoxAdapter(
        child: EmptyState(
          hasActiveFilter: _controller.hasActiveFilter,
          onClear: () {
            _controller.clearFilters();
            _searchController.clear();
          },
        ),
      );
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.pagePadding),
      sliver: SliverList.separated(
        itemCount: budgetTours.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final tour = budgetTours[index];
          return BudgetTourTile(
            tour: tour,
            onTap: () => _openDetails(tour),
          );
        },
      ),
    );
  }

  Widget _buildSeeAllButtons() {
    return TextButton(
      onPressed: _controller.filteredBudgetTours.length > 3
          ? _controller.toggleShowAllBudgetTours
          : null,
      style: TextButton.styleFrom(
        foregroundColor: AppColors.teal,
        disabledForegroundColor: AppColors.textSecondary,
        padding: EdgeInsets.zero,
        minimumSize: const Size(48, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(_controller.showAllBudgetTours ? 'Show Less' : 'See All'),
    );
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  void _openDetails(dynamic item) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => DetailsPage(
        title: item.title,
        imagePath: item.imagePath,
        location: item.location,
        price: item.price,
        rating: item is Destination ? item.rating : 4.8,
        reviewCount: item is Destination ? item.reviewCount : 120,
        isFavorite: item is Destination ? _controller.isFavorite(item.title) : false,
      ),
    ));
  }
}

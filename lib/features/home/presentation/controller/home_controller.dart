import 'package:flutter/material.dart';
import '../../data/local_mock_data.dart';
import '../../models/budget_tour.dart';
import '../../models/category.dart';
import '../../models/destination.dart';

class HomeController extends ChangeNotifier {
  final List<Category> categories = LocalMockData.categories;
  final List<Destination> _destinations = LocalMockData.destinations;
  final List<BudgetTour> _budgetTours = LocalMockData.budgetTours;

  late final Set<String> _favoriteDestinations;
  String _query = '';
  int? _selectedCategoryIndex;
  bool _favoritesOnly = false;
  bool _showAllBudgetTours = false;
  int _visitedPageIndex = 0;

  HomeController() {
    _favoriteDestinations = {
      for (final destination in _destinations)
        if (destination.isFavorite) destination.title,
    };
  }

  // Getters
  String get query => _query;
  int? get selectedCategoryIndex => _selectedCategoryIndex;
  bool get favoritesOnly => _favoritesOnly;
  bool get showAllBudgetTours => _showAllBudgetTours;
  int get visitedPageIndex => _visitedPageIndex;

  List<Destination> get filteredDestinations {
    return _destinations.where((destination) {
      final matchesQuery = _matchesQuery([
        destination.title,
        destination.location,
        destination.price,
      ]);
      final matchesCategory = _matchesSelectedCategory([
        destination.title,
        destination.location,
      ]);
      final matchesFavorite =
          !_favoritesOnly || _favoriteDestinations.contains(destination.title);

      return matchesQuery && matchesCategory && matchesFavorite;
    }).toList();
  }

  List<BudgetTour> get filteredBudgetTours {
    return _budgetTours.where((tour) {
      final matchesQuery = _matchesQuery([
        tour.title,
        tour.duration,
        tour.location,
        tour.price,
      ]);
      final matchesCategory = _matchesSelectedCategory([
        tour.title,
        tour.duration,
        tour.location,
      ]);

      return matchesQuery && matchesCategory;
    }).toList();
  }

  List<BudgetTour> get visibleBudgetTours {
    final tours = filteredBudgetTours;
    if (_showAllBudgetTours || tours.length <= 3) {
      return tours;
    }
    return tours.take(3).toList();
  }

  bool get hasActiveFilter =>
      _query.trim().isNotEmpty ||
      _selectedCategoryIndex != null ||
      _favoritesOnly;

  bool isFavorite(String title) => _favoriteDestinations.contains(title);

  // Actions
  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }

  void selectCategory(int index) {
    if (_selectedCategoryIndex == index || categories[index].title == 'More') {
      _selectedCategoryIndex = null;
    } else {
      _selectedCategoryIndex = index;
    }
    notifyListeners();
  }

  void toggleFavorite(String title) {
    if (_favoriteDestinations.contains(title)) {
      _favoriteDestinations.remove(title);
    } else {
      _favoriteDestinations.add(title);
    }
    notifyListeners();
  }

  void toggleFavoriteFilter() {
    _favoritesOnly = !_favoritesOnly;
    notifyListeners();
  }

  void toggleShowAllBudgetTours() {
    _showAllBudgetTours = !_showAllBudgetTours;
    notifyListeners();
  }

  void setVisitedPageIndex(int index) {
    _visitedPageIndex = index;
    notifyListeners();
  }

  void clearFilters() {
    _query = '';
    _selectedCategoryIndex = null;
    _favoritesOnly = false;
    _showAllBudgetTours = false;
    notifyListeners();
  }

  bool _matchesQuery(List<String> fields) {
    final query = _query.trim().toLowerCase();
    if (query.isEmpty) return true;
    return fields.any((field) => field.toLowerCase().contains(query));
  }

  bool _matchesSelectedCategory(List<String> fields) {
    final index = _selectedCategoryIndex;
    if (index == null || categories[index].title == 'More') return true;
    final category = categories[index].title.toLowerCase();
    return fields.any((field) => field.toLowerCase().contains(category));
  }
}

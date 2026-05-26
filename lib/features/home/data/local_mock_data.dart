import '../../../../core/constants/app_assets.dart';
import '../models/budget_tour.dart';
import '../models/category.dart';
import '../models/destination.dart';

class LocalMockData {
  const LocalMockData._();

  static const List<Category> categories = [
    Category(title: 'Airport', iconPath: AppAssets.flightIcon),
    Category(title: 'Taxi', iconPath: AppAssets.taxiIcon),
    Category(title: 'Hotel', iconPath: AppAssets.hotelIcon),
    Category(title: 'More', iconPath: AppAssets.moreIcon),
  ];

  static const List<Destination> destinations = [
    Destination(
      title: 'Tahiti Beach',
      location: 'Polynesia, French',
      imagePath: AppAssets.destinationImage,
      price: r'$235',
      rating: 4.4,
      reviewCount: 32,
      isFavorite: true,
    ),
    Destination(
      title: 'St. Lucia Mountain',
      location: 'South America',
      imagePath: AppAssets.destinationImageAlt,
      price: r'$182',
      rating: 4.4,
      reviewCount: 41,
    ),
    Destination(
      title: 'Airport Island',
      location: 'Maldives',
      imagePath: AppAssets.destinationImage,
      price: r'$210',
      rating: 4.6,
      reviewCount: 54,
      imageAlignmentY: -0.2,
    ),
    Destination(
      title: 'Taxi Bay',
      location: 'Greece',
      imagePath: AppAssets.destinationImageAlt,
      price: r'$168',
      rating: 4.3,
      reviewCount: 28,
    ),
    Destination(
      title: 'Hotel Coral Coast',
      location: 'Australia',
      imagePath: AppAssets.destinationImage,
      price: r'$256',
      rating: 4.8,
      reviewCount: 63,
      imageAlignmentY: 0.25,
    ),
    Destination(
      title: 'Andes Hotel View',
      location: 'Peru',
      imagePath: AppAssets.destinationImageAlt,
      price: r'$190',
      rating: 4.5,
      reviewCount: 37,
    ),
    Destination(
      title: 'Airport Lagoon',
      location: 'Bali',
      imagePath: AppAssets.destinationImage,
      price: r'$224',
      rating: 4.7,
      reviewCount: 49,
    ),
    Destination(
      title: 'Taxi Ridge',
      location: 'South America',
      imagePath: AppAssets.destinationImageAlt,
      price: r'$176',
      rating: 4.2,
      reviewCount: 22,
      imageAlignmentY: -0.15,
    ),
  ];

  static const List<BudgetTour> budgetTours = [
    BudgetTour(
      title: 'Ledadu Beach',
      duration: '3 days 2 nights',
      location: 'Australia',
      imagePath: AppAssets.budgetTourImage,
      price: r'$20',
    ),
    BudgetTour(
      title: 'Endigada Beach',
      duration: '5 days 4 nights',
      location: 'Australia',
      imagePath: AppAssets.budgetTourImageAlt,
      price: r'$25',
    ),
    BudgetTour(
      title: 'Airport Weekend',
      duration: '2 days 1 night',
      location: 'Netherlands',
      imagePath: AppAssets.budgetTourImage,
      price: r'$18',
      imageAlignmentY: -0.2,
    ),
    BudgetTour(
      title: 'Taxi City Tour',
      duration: '1 day',
      location: 'Thailand',
      imagePath: AppAssets.budgetTourImageAlt,
      price: r'$15',
    ),
    BudgetTour(
      title: 'Hotel Palm Stay',
      duration: '4 days 3 nights',
      location: 'Maldives',
      imagePath: AppAssets.budgetTourImage,
      price: r'$32',
      imageAlignmentY: 0.2,
    ),
    BudgetTour(
      title: 'Coral Island',
      duration: '3 days 2 nights',
      location: 'Greece',
      imagePath: AppAssets.budgetTourImageAlt,
      price: r'$27',
    ),
    BudgetTour(
      title: 'Airport Sunrise',
      duration: '2 days 2 nights',
      location: 'Bali',
      imagePath: AppAssets.budgetTourImage,
      price: r'$22',
    ),
    BudgetTour(
      title: 'Hotel Cliff Route',
      duration: '6 days 5 nights',
      location: 'Peru',
      imagePath: AppAssets.budgetTourImageAlt,
      price: r'$35',
      imageAlignmentY: -0.1,
    ),
  ];
}

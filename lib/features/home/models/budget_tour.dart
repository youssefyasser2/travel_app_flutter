class BudgetTour {
  const BudgetTour({
    required this.title,
    required this.duration,
    required this.location,
    required this.imagePath,
    required this.price,
    this.imageAlignmentY = 0,
  });

  final String title;
  final String duration;
  final String location;
  final String imagePath;
  final String price;
  final double imageAlignmentY;
}

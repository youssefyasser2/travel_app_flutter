class Destination {
  const Destination({
    required this.title,
    required this.location,
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.isFavorite = false,
    this.imageAlignmentY = 0,
  });

  final String title;
  final String location;
  final String imagePath;
  final String price;
  final double rating;
  final int reviewCount;
  final bool isFavorite;
  final double imageAlignmentY;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/detail_app_bar.dart';
import 'widgets/detail_bottom_bar.dart';
import 'widgets/detail_content.dart';
import 'widgets/hero_image.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    required this.title,
    required this.imagePath,
    required this.location,
    required this.price,
    this.rating,
    this.reviewCount,
    this.isFavorite = false,
    super.key,
  });

  final String title;
  final String imagePath;
  final String location;
  final String price;
  final double? rating;
  final int? reviewCount;
  final bool isFavorite;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  static const double _heroHeight = 360.0;
  static const double _cardOverlap = 44.0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: DetailBottomBar(
          price: widget.price,
          onBookNow: () {},
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: _heroHeight,
              child: HeroImage(imagePath: widget.imagePath),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: DetailAppBar(onBackPressed: () => Navigator.of(context).pop()),
            ),
            Positioned.fill(
              top: _heroHeight - _cardOverlap,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: DetailContent(
                  title: widget.title,
                  location: widget.location,
                  isFavorite: _isFavorite,
                  onFavoriteTap: () => setState(() => _isFavorite = !_isFavorite),
                  rating: widget.rating,
                  reviewCount: widget.reviewCount,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

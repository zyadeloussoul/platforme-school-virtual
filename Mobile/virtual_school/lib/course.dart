import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String image;
  final String price;
  final String category;
  final String description;
  final int rating;
  final String url;

  CourseCard({
    required this.title,
    required this.image,
    required this.price,
    required this.category,
    required this.description,
    required this.rating,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Your card UI here
    );
  }
}

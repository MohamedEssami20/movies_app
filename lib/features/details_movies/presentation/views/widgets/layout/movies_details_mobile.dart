import 'package:flutter/material.dart';
import '../movie_title_and_other_details.dart';
import '../movies_review_image_details.dart' show MoviesImageReviewDetails;

class MoviesDetailsMobile extends StatelessWidget {
  const MoviesDetailsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MoviesImageReviewDetails(),
        Expanded(child: MoviesTitleAndOtherDetails()),
      ],
    );
  }
}

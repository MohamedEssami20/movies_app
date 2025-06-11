import 'package:flutter/material.dart';

import '../movie_title_and_other_details.dart' show MoviesTitleAndOtherDetails;
import '../movies_review_image_details.dart' show MoviesImageReviewDetails;

class MoviesDetailsTablet extends StatelessWidget {
  const MoviesDetailsTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MoviesImageReviewDetails(),
      Expanded(child: MoviesTitleAndOtherDetails()),
    ]);
  }
}

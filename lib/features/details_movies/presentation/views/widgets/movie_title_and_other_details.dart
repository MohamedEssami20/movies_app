import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart' show Assets;
import 'movies_relase_date_and_reviews.dart';
import 'movies_type_and_time.dart';

class MoviesTitleAndOtherDetails extends StatelessWidget {
  const MoviesTitleAndOtherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Dark Knight Rises',
            textAlign: TextAlign.left,
            style:
                AppTextStyles.semiBold24(context).copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          MoviesTypeAndTime(width: width),
          const SizedBox(height: 18),
          MovieRelaseDateAndReviews(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

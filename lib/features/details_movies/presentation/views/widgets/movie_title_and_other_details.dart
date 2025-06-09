import 'package:flutter/material.dart';
import 'package:movies_app/features/details_movies/presentation/views/widgets/movie_overview.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'movies_relase_date_and_reviews.dart';
import 'movies_type_and_time.dart';
import 'watch_trailler_and_add_watch_list_buttons.dart';

class MoviesTitleAndOtherDetails extends StatelessWidget {
  const MoviesTitleAndOtherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'The Dark Knight Rises',
              textAlign: TextAlign.left,
              style: AppTextStyles.semiBold24(context)
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            MoviesTypeAndTime(width: width),
            const SizedBox(height: 18),
            MovieRelaseDateAndReviews(),
            const SizedBox(height: 20),
            WatchTrailerAndAddToWatchListButtons(),
            const SizedBox(height: 20),
            MovieOverView(),
          ],
        ),
      ),
    );
  }
}

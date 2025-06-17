import 'package:flutter/material.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_casting_entity.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_details_entity.dart';
import 'package:movies_app/features/details_movies/presentation/views/widgets/movie_overview.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'movies_other_details.dart';
import 'movies_relase_date_and_reviews.dart';
import 'movies_type_and_time.dart';
import 'top_casting_list_view.dart';
import 'watch_trailler_and_add_watch_list_buttons.dart';

class MoviesTitleAndOtherDetails extends StatelessWidget {
  const MoviesTitleAndOtherDetails(
      {super.key, required this.movieDetails, required this.moviesCasting});
  final MoviesDetailsEntity movieDetails;
  final List<MoviesCastingEntity> moviesCasting;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieDetails.movieTitle,
              textAlign: TextAlign.left,
              style: AppTextStyles.semiBold24(context)
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            MoviesTypeAndTime(
              moviesDuration: movieDetails.movieDuration,
              moviesGenres: movieDetails.movieGenres,
            ),
            const SizedBox(height: 18),
            MovieRelaseDateAndReviews(
              relaseDate: movieDetails.movieDateRelease,
              voteAverage: movieDetails.movieRating,
              voteCount: movieDetails.movieVoteCount,
            ),
            const SizedBox(height: 20),
            WatchTrailerAndAddToWatchListButtons(),
            const SizedBox(height: 20),
            MovieOverView(
              movieOverView: movieDetails.movieOverview,
            ),
            const SizedBox(height: 20),
            Text(
              "Details",
              style: AppTextStyles.semiBold16(context)
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            MoviesOtherDetails(
              genres: movieDetails.movieGenres,
              relaseDate: movieDetails.movieDateRelease,
              orignalCountry: movieDetails.movieOriginCountry,
              productionCompanies: movieDetails.movieProductionCompanies,
            ),
            const SizedBox(height: 20),
            Text(
              "Top Cast",
              style: AppTextStyles.semiBold16(context)
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TopCastingListView(
              moviesCasting: moviesCasting,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

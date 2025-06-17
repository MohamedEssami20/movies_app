import 'package:flutter/material.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_casting_entity.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_details_entity.dart';

import '../movie_title_and_other_details.dart' show MoviesTitleAndOtherDetails;
import '../movies_review_image_details.dart' show MoviesImageReviewDetails;

class MoviesDetailsTablet extends StatelessWidget {
  const MoviesDetailsTablet(
      {super.key, required this.casting, required this.moviesDetailsEntity});
  final List<MoviesCastingEntity> casting;
  final MoviesDetailsEntity moviesDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      MoviesImageReviewDetails(
        imageUrl: moviesDetailsEntity.movieImage,
      ),
      Expanded(
        child: MoviesTitleAndOtherDetails(
          movieDetails: moviesDetailsEntity,
          moviesCasting: casting,
        ),
      ),
    ]);
  }
}

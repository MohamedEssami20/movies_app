import 'package:flutter/material.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_casting_entity.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_details_entity.dart';
import '../movie_title_and_other_details.dart';
import '../movies_review_image_details.dart' show MoviesImageReviewDetails;

class MoviesDetailsMobile extends StatelessWidget {
  const MoviesDetailsMobile(
      {super.key, required this.casts, required this.moviesDetailsEntity});
  final List<MoviesCastingEntity> casts;
  final MoviesDetailsEntity moviesDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MoviesImageReviewDetails(
          imageUrl: moviesDetailsEntity.movieImage,
        ),
        Expanded(
          child: MoviesTitleAndOtherDetails(
            movieDetails: moviesDetailsEntity,
            moviesCasting: casts,
          ),
        ),
      ],
    );
  }
}

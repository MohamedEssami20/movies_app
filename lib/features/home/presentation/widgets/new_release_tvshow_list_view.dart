import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/api_end_points.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';

import 'movies_item.dart';

class TopRatingListView extends StatelessWidget {
  const TopRatingListView({super.key, required this.topRatingMovies});
  final List<TopRatingMoviesEntity> topRatingMovies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: topRatingMovies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 16),
                child: MoviesItem(
                  movieTitle: topRatingMovies[index].movieTitle,
                  imageUrl: ApiEndPoints.imagebaseUrl +
                      topRatingMovies[index].moviePoster.toString(),
                ),
              );
            }),
      ),
    );
  }
}

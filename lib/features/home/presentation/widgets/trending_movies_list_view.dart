
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/api_end_points.dart';
import '../../domain/entities/popular_movies_entity.dart';
import 'trending_movies_item.dart';

class TrendingMoviesListView extends StatelessWidget {
  const TrendingMoviesListView({super.key, required this.popularMovies});
  final List<PopularMoviesEntity> popularMovies;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 216,
        child: ListView.builder(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: popularMovies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12),
                child: TrendingMoviesItem(
                  imageUrl: ApiEndPoints.imagebaseUrl +
                      popularMovies[index].moviePoster.toString(),
                  movieTitle: popularMovies[index].movieTitle,
                  isLoading: popularMovies.isEmpty,
                ),
              );
            }),
      ),
    );
  }
}

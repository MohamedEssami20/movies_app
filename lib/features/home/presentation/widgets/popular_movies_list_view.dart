
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/api_end_points.dart';
import '../../domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'movies_item.dart';

class PopularMoviesListView extends StatelessWidget{
  const PopularMoviesListView({super.key, required this.popularMovies, required this.scrollController});
  final List<PopularMoviesEntity> popularMovies;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          key: PageStorageKey("PopularMoviesListView"),
          addAutomaticKeepAlives: true,
          physics: const BouncingScrollPhysics(),
            controller: scrollController,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: popularMovies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12),
                child: MoviesItem(
                  imageUrl: ApiEndPoints.imagebaseUrl +
                      popularMovies[index].moviePoster.toString(),
                  movieTitle: popularMovies[index].movieTitle,
                ),

              );
            }),
      ),
    );
  }
}

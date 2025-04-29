import 'package:flutter/material.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_item.dart';

import '../../../../core/utils/api_end_points.dart';
import '../../domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';

class UpComingMoviesListView extends StatelessWidget {
  const UpComingMoviesListView({super.key, required this.upComingMovies, required this.scrollController});
  final List<UpComingMoviesEntity> upComingMovies;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
            controller: scrollController,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: upComingMovies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 16),
                child: MoviesItem(
                  movieTitle: upComingMovies[index].movieTitle,
                  imageUrl: ApiEndPoints.imagebaseUrl +
                      upComingMovies[index].moviePoster.toString(),
                ),
              );
            }),
      ),
    );
  }
}

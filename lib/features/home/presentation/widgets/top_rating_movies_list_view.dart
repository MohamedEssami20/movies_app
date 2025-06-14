import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/api_end_points.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';

import '../../../details_movies/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import '../../../details_movies/presentation/views/movies_details_view.dart';
import 'movies_item.dart';

class TopRatingListView extends StatelessWidget {
  const TopRatingListView(
      {super.key,
      required this.topRatingMovies,
      required this.scrollController});
  final List<TopRatingMoviesEntity> topRatingMovies;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
            key: PageStorageKey("TopRatingListView"),
            controller: scrollController,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: topRatingMovies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {
                    final movieDetailsCubit =
                        context.read<MoviesDetailsCubit>();
                    context.read<MoviesDetailsCubit>().getMoviesDetails(
                          movieId: topRatingMovies[index].movieId,
                        );
                    Navigator.pushNamed(context, MoviesDetailsView.routeName,
                        arguments: movieDetailsCubit);
                  },
                  child: MoviesItem(
                    movieTitle: topRatingMovies[index].movieTitle,
                    imageUrl: ApiEndPoints.imagebaseUrl +
                        topRatingMovies[index].moviePoster.toString(),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

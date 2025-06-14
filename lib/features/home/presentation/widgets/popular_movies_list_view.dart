import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/api_end_points.dart';
import 'package:movies_app/features/details_movies/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import 'package:movies_app/features/details_movies/presentation/views/movies_details_view.dart';
import '../../domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'movies_item.dart';

class PopularMoviesListView extends StatelessWidget {
  const PopularMoviesListView(
      {super.key, required this.popularMovies, required this.scrollController});
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
                child: GestureDetector(
                  onTap: () {
                    final movieDetailsCubit =
                        context.read<MoviesDetailsCubit>();
                    context.read<MoviesDetailsCubit>().getMoviesDetails(
                          movieId: popularMovies[index].movieId,
                        );
                    Navigator.pushNamed(context, MoviesDetailsView.routeName,
                        arguments: movieDetailsCubit);
                  },
                  child: MoviesItem(
                    imageUrl: ApiEndPoints.imagebaseUrl +
                        popularMovies[index].moviePoster.toString(),
                    movieTitle: popularMovies[index].movieTitle,
                  ),
                ),
              );
            }),
      ),
    );
  }
}

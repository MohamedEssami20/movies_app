import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_item.dart';

import '../../../../core/utils/api_end_points.dart';
import '../../../details_movies/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import '../../../details_movies/presentation/views/movies_details_view.dart';
import '../../domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';

class UpComingMoviesListView extends StatelessWidget {
  const UpComingMoviesListView(
      {super.key,
      required this.upComingMovies,
      required this.scrollController});
  final List<UpComingMoviesEntity> upComingMovies;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
            key: PageStorageKey("UpComingMoviesListView"),
            controller: scrollController,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemCount: upComingMovies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {
                    final movieDetailsCubit =
                        context.read<MoviesDetailsCubit>();
                    context.read<MoviesDetailsCubit>().getMoviesDetails(
                          movieId: upComingMovies[index].movieId,
                        );
                    Navigator.pushNamed(context, MoviesDetailsView.routeName,
                        arguments: movieDetailsCubit);
                  },
                  child: MoviesItem(
                    movieTitle: upComingMovies[index].movieTitle,
                    imageUrl: ApiEndPoints.imagebaseUrl +
                        upComingMovies[index].moviePoster.toString(),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

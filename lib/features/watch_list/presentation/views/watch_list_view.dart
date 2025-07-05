import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watch_list/presentation/manager/cubit/watch_list_movies_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/views/widgets/watch_list_movies_list_view.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WatchListMoviesCubit>().getWatchListMovies();
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<WatchListMoviesCubit, WatchListMoviesState>(
            builder: (context, state) {
              if (state is GetWatchListMoviesSuccess) {
                return WatchListMoviesListView(
                  movies: state.watchListMovies,
                );
              } else if (state is GetWatchListMoviesFailure) {
                return Center(
                  child: Text(
                    state.errorMessage.toString(),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

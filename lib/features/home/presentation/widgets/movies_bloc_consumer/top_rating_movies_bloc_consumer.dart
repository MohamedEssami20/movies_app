import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/widgets/new_release_tvshow_list_view.dart';

import '../../../../../core/utils/custom_error_snack_bar.dart';
import '../../manager/top_rating_movies/top_rating_movies_cubit.dart';

class TopRatingMoviesBlocConsumer extends StatelessWidget {
  const TopRatingMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopRatingMoviesCubit, TopRatingMoviesState>(
      builder: (context, state) {
        if (state is TopRatingMoviesSuccess ||
            state is TopRatingMoviesLoading) {
          return TopRatingListView(
            topRatingMovies:
                context.read<TopRatingMoviesCubit>().currentTopRatingMovies,
          );
        } else if (state is TopRatingMoviesFailure) {
          return Center(
            child: Text(
              "${state.errorMessage.toString()}😢",
            ),
          );
        } else {
          return TopRatingListView(
            topRatingMovies: [],
          );
        }
      },
      listener: (context, state) {
        if (state is TopRatingMoviesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            customErrorSnackBar(
              context,
              state.errorMessage.toString(),
            ),
          );
        }
      },
    );
  }
}

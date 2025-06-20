import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/widgets/top_rating_movies_list_view.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../manager/top_rating_movies/top_rating_movies_cubit.dart';

class TopRatingMoviesBlocConsumer extends StatelessWidget {
  const TopRatingMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TopRatingMoviesCubit, TopRatingMoviesState>(
      builder: (context, state) {
        if (state is TopRatingMoviesSuccess ||
            state is TopRatingMoviesPaginationSuccess ||
            state is TopRatingMoviesPaginationLoading ||
            state is TopRatingMoviesPaginationFailure) {
          return TopRatingListView(
            topRatingMovies:
                context.read<TopRatingMoviesCubit>().currentTopRatingMovies,
            scrollController:
                context.read<TopRatingMoviesCubit>().scrollController,
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
            scrollController: ScrollController(),
          );
        }
      },
      listener: (context, state) {
        if (state is TopRatingMoviesFailure) {
          showAnimatedSnackBar(
            context,
            message: state.errorMessage,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is TopRatingMoviesPaginationFailure) {
          showAnimatedSnackBar(
            context,
            message: state.errorMessage,
            type: AnimatedSnackBarType.error,
          );
        }
      },
    );
  }
}

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/drama_movies_cubit/drama_movies_cubit.dart';
import '../movies/drama_movies_view.dart';

class DramaMoviesBlocConsumer extends StatelessWidget {
  const DramaMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DramaMoviesCubit, DramaMoviesState>(
      builder: (context, state) {
        if (state is DramaMoviesSuccess ||
            state is DramaMoviesPaginationSuccess ||
            state is DramaMoviesPaginationLoading ||
            state is DramaMoviesPaginationFailure) {
          return DramaMoviesView(
            dramaMovies:
                context.read<DramaMoviesCubit>().currentDramaMovies,
            scrollController:
                context.read<DramaMoviesCubit>().scrollController,
          );
        } else if (state is DramaMoviesFailure) {
          return Center(
            child: Text(
              "${state.errorMessage.toString()}😢",
              style: AppTextStyles.regular12(context)
                  .copyWith(color: Colors.white),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue.shade900,
            ),
          );
        }
      },
      listener: (context, state) {
        if (state is DramaMoviesFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is DramaMoviesPaginationFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }
      },
    );
  }
}

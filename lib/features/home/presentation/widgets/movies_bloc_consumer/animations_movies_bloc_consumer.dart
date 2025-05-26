import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/animations_movies_cubit/animations_movies_cubit.dart';
import '../movies/animation_movies_view.dart';

class AnimationsMoviesBlocConsumer extends StatelessWidget {
  const AnimationsMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimationsMoviesCubit, AnimationsMoviesState>(
      builder: (context, state) {
        if (state is AnimationsMoviesSuccess ||
            state is AnimationsMoviesPaginationSuccess ||
            state is AnimationsMoviesPaginationLoading ||
            state is AnimationsMoviesPaginationFailure) {
          return AnimationMoviesView(
            animationsMovies:
                context.read<AnimationsMoviesCubit>().currentAnimationsMovies,
            scrollController:
                context.read<AnimationsMoviesCubit>().scrollController,
          );
        } else if (state is AnimationsMoviesFailure) {
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
        if (state is AnimationsMoviesFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is AnimationsMoviesPaginationFailure) {
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

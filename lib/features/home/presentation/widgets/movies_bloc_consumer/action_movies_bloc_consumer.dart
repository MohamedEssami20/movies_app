import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/action_movies/action_movies_cubit.dart';
import '../movies/action_movies_view.dart';

class ActionMoviesBlocConsumer extends StatelessWidget {
  const ActionMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActionMoviesCubit, ActionMoviesState>(
      builder: (context, state) {
        if (state is ActionMoviesSuccess ||
            state is ActionMoviesPaginationSuccess ||
            state is ActionMoviesPaginationLoading ||
            state is ActionMoviesPaginationFailure) {
          return ActionMoviesView(
            actionMovies: context.read<ActionMoviesCubit>().currentActionMovies,
            scrollController:
                context.read<ActionMoviesCubit>().scrollController,
          );
        } else if (state is ActionMoviesFailure) {
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
        if (state is ActionMoviesFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is ActionMoviesPaginationFailure) {
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

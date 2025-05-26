import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/horror_movies_cubit/horror_movies_cubit.dart';
import '../movies/horror_movies_view.dart';

class HorrorMoviesBlocConsumer extends StatelessWidget {
  const HorrorMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HorrorMoviesCubit, HorrorMoviesState>(
      builder: (context, state) {
        if (state is HorrorMoviesSuccess ||
            state is HorrorMoviesPaginationSuccess ||
            state is HorrorMoviesPaginationLoading ||
            state is HorrorMoviesPaginationFailure) {
          return HorrorMoviesView(
            horrorMovies: context.read<HorrorMoviesCubit>().currentHorrorMovies,
            scrollController:
                context.read<HorrorMoviesCubit>().scrollController,
          );
        } else if (state is HorrorMoviesFailure) {
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
        if (state is HorrorMoviesFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is HorrorMoviesPaginationFailure) {
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

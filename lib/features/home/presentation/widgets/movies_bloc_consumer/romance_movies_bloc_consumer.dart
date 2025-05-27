import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/romance_movies_cubit/romance_movies_cubit.dart';
import '../movies/romance_movies_view.dart';

class RomanceMoviesBlocConsumer extends StatelessWidget {
  const RomanceMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RomanceMoviesCubit, RomanceMoviesState>(
      builder: (context, state) {
        if (state is RomanceMoviesSuccess ||
            state is RomanceMoviesPaginationSuccess ||
            state is RomanceMoviesPaginationLoading ||
            state is RomanceMoviesPaginationFailure) {
          return RomanceMoviesView(
            romanceMovies:
                context.read<RomanceMoviesCubit>().currentRomanceMovies,
            scrollController:
                context.read<RomanceMoviesCubit>().scrollController,
          );
        } else if (state is RomanceMoviesFailure) {
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
        if (state is RomanceMoviesFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is RomanceMoviesPaginationFailure) {
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

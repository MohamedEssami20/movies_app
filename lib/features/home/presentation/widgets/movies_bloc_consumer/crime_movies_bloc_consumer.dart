import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/crime_movies_cubit/crime_movies_cubit.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../movies/crime_movies_view.dart';

class CrimeMoviesBlocConsumer extends StatelessWidget {
  const CrimeMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CrimeMoviesCubit, CrimeMoviesState>(
      builder: (context, state) {
        if (state is CrimeMoviesSuccess ||
            state is CrimeMoviesPaginationSuccess ||
            state is CrimeMoviesPaginationLoading ||
            state is CrimeMoviesPaginationFailure) {
          return CrimeMoviesView(
            crimeMoviesEntity:
                context.read<CrimeMoviesCubit>().currentCrimeMovies,
            scrollController: context.read<CrimeMoviesCubit>().scrollController,
          );
        } else if (state is CrimeMoviesFailure) {
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
        if (state is CrimeMoviesFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is CrimeMoviesPaginationFailure) {
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

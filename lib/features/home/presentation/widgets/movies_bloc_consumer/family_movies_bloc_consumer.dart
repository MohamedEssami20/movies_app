import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/family_movies/family_movies_cubit.dart';
import '../movies/family_movies_view.dart';

class FamilyMoviesBlocConsumer extends StatelessWidget {
  const FamilyMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FamilyMoviesCubit, FamilyMoviesState>(
      builder: (context, state) {
        if (state is FamilyMoviesSuccess ||
            state is FamilyMoviesPaginationSuccess ||
            state is FamilyMoviesPaginationLoading ||
            state is FamilyMoviesPaginationFailure) {
          return FamilyMoviesView(
            familyMovies: context.read<FamilyMoviesCubit>().currentFamilyMovies,
            scrollController:
                context.read<FamilyMoviesCubit>().scrollController,
          );
        } else if (state is FamilyMoviesFailure) {
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
        if (state is FamilyMoviesFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is FamilyMoviesPaginationFailure) {
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

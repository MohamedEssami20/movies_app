import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/comedy_movies_cubit/comedy_movies_cubit.dart';
import '../movies/comedy_movies_view.dart';

class ComedyMoviesBlocConsumer extends StatelessWidget {
  const ComedyMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComedyMoviesCubit, ComedyMoviesState>(
      builder: (context, state) {
        if (state is ComedyMoviesSuccess ||
            state is ComedyMoviesPaginationSuccess ||
            state is ComedyMoviesPaginationLoading ||
            state is ComedyMoviesPaginationFailure) {
          return ComedyMoviesView(
            comedyMovies: context.read<ComedyMoviesCubit>().currentComedyMovies,
            scrollController:
                context.read<ComedyMoviesCubit>().scrollController,
          );
        } else if (state is ComedyMoviesFailure) {
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
        if (state is ComedyMoviesFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is ComedyMoviesPaginationFailure) {
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

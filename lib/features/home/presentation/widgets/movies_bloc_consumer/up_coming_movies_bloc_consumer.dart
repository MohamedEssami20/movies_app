import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/up_coming_movies_cubit/up_coming_movies_cubit.dart';
import '../upcoming_movies_list_view.dart';

class UpComingMoviesBlocConsumer extends StatelessWidget {
  const UpComingMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpComingMoviesCubit, UpComingMoviesState>(
      builder: (context, state) {
        if (state is UpComingMoviesSuccess ||
            state is UpComingMoviesPaginationSuccess ||
            state is UpComingMoviesPaginationLoading ||
            state is UpComingMoviesPaginationFailure) {
          return UpComingMoviesListView(
            upComingMovies:
                context.read<UpComingMoviesCubit>().currentUpComingMovies,
            scrollController:
                context.read<UpComingMoviesCubit>().scrollController,
          );
        } else if (state is UpComingMoviesFailure) {
          return Center(
            child: Text(
              "${state.errorMessage.toString()}😢",
              style: AppTextStyles.regular12(context)
                  .copyWith(color: Colors.white),
            ),
          );
        } else {
          return UpComingMoviesListView(
            upComingMovies: [],
            scrollController: ScrollController(),
          );
        }
      },
      listener: (context, state) {
        if (state is UpComingMoviesFailure) {
          showAnimatedSnackBar(
            context,
            message: state.errorMessage,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is UpComingMoviesPaginationFailure) {
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

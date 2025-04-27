import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/popular_movies_cubit/popular_movies_cubit.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/custom_error_snack_bar.dart';
import '../popular_movies_list_view.dart';

class PopularMoviesBlocConsumer extends StatelessWidget {
  const PopularMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularMoviesCubit, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesSuccess ||
            state is PopularMoviesPaginationSuccess ||
            state is PopularMoviesPaginationLoading ||
            state is PopularMoviesPaginationFailure) {
          return PopularMoviesListView(
            popularMovies:
                context.read<PopularMoviesCubit>().currentPoupularMovies,
            scrollController:context.read<PopularMoviesCubit>().scrollController,
          );
        } else if (state is PopularMoviesFailure) {
          return Center(
            child: Text(
              "${state.errorMessage.toString()}😢",
              style: AppTextStyles.regular12(context)
                  .copyWith(color: Colors.white),
            ),
          );
        } else {
          return PopularMoviesListView(
              popularMovies: [],
              scrollController: ScrollController(),
              );
        }
      },
      listener: (context, state) {
        if (state is PopularMoviesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            customErrorSnackBar(
              context,
              state.errorMessage.toString(),
            ),
          );
        }
        if (state is PopularMoviesPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            customErrorSnackBar(
              context,
              state.errorMessage.toString(),
            ),
          );
        }
      },
    );
  }
}

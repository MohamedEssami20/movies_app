import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/custom_error_snack_bar.dart';
import '../../manager/up_coming_movies_cubit/up_coming_movies_cubit.dart';
import '../recomended_movies_list_view.dart';

class UpComingMoviesBlocConsumer extends StatelessWidget {
  const UpComingMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpComingMoviesCubit, UpComingMoviesState>(
      builder: (context, state) {
        if (state is UpComingMoviesSuccess 
        || state is UpComingMoviesPaginationSuccess ||
        state is UpComingMoviesPaginationLoading ||
        state is UpComingMoviesPaginationFailure) {
          return UpComingMoviesListView(
            upComingMovies:
                context.read<UpComingMoviesCubit>().currentUpComingMovies,
            scrollController: context.read<UpComingMoviesCubit>().scrollController,
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
          ScaffoldMessenger.of(context).showSnackBar(
            customErrorSnackBar(
              context,
              state.errorMessage.toString(),
            ),
          );
        }

        if (state is UpComingMoviesPaginationFailure) {
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

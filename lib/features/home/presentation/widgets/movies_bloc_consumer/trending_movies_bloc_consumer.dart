import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/widgets/trending_movies_list_view.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/trending_movies_cubit/trending_movies_cubit.dart';

class TrendingMoviesBlocConsumer extends StatelessWidget {
  const TrendingMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrendingMoviesCubit, TrendingMoviesState>(
      builder: (context, state) {
        if (state is TrendingMoviesSuccess ||
            state is TrendingMoviesPaginationSuccess ||
            state is TrendingMoviesPaginationLoading ||
            state is TrendingMoviesPaginationFailure) {
          return TrendingMoviesListView(
            trendingMoives:
                context.read<TrendingMoviesCubit>().currentTrendingMovies,
            scrollController:
                context.read<TrendingMoviesCubit>().scrollController,
          );
        } else if (state is TrendingMoviesFailure) {
          return Center(
            child: Text(
              "${state.errorMessage.toString()}😢",
              style: AppTextStyles.regular12(context)
                  .copyWith(color: Colors.white),
            ),
          );
        } else {
          return TrendingMoviesListView(
            trendingMoives: [],
            scrollController: ScrollController(),
          );
        }
      },
      listener: (context, state) {
        if (state is TrendingMoviesFailure) {
         showAnimatedSnackBar(
            context,
            message: state.errorMessage,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is TrendingMoviesPaginationFailure) {
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

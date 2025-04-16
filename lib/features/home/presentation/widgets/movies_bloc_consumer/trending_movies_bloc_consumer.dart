import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/movies_cubit/movies_cubit.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/custom_error_snack_bar.dart';
import '../now_playing_poster.dart';
import '../trending_movies_item.dart';

class TrendingMoviesBlocConsumer extends StatelessWidget {
  const TrendingMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesLoading ||
            state is PopularMoviesSuccess) {
          return TrendingMoviesItem();
        } else if (state is PopularMoviesFailure) {
          return Center(
            child: Text(
              "${state.errorMessage.toString()}😢",
              style: AppTextStyles.regular12(context)
                  .copyWith(color: Colors.white),
            ),
          );
        } else {
          return NowPlayingPoster(
            nowPlayingEntity: [],
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
      },
    );
  }
}

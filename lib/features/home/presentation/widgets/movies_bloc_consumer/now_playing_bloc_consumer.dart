import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/manager/now_playing_movies_cubit/now_playing_movies_cubit.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/custom_error_snack_bar.dart';
import '../now_playing_poster.dart';

class NowPlayingBlocConsumer extends StatelessWidget {
  const NowPlayingBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NowPlayingMoviesCubit, NowPlayingMoviesState>(
      builder: (context, state) {
        if (state is NowPlayingMoviesSuccess ||
            state is NowPlayingMoviesLoading) {
          return NowPlayingPoster(
            nowPlayingEntity:
                context.read<NowPlayingMoviesCubit>().currentNowPlayingEntity,
          );
        } else if (state is NowPlayingMoviesFailure) {
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
        if (state is NowPlayingMoviesFailure) {
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

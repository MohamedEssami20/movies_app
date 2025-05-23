import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home/presentation/widgets/movies/adventure_movies_view.dart';
import '../../../../../core/func/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../manager/adventure_movies_cubit/adventure_movies_cubit.dart';

class AdventureMoviesBlocConsumer extends StatelessWidget {
  const AdventureMoviesBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdventureMoviesCubit, AdventureMoviesState>(
      builder: (context, state) {
        if (state is AdventureMoviesSuccess ||
            state is AdventureMoviesPaginationSuccess ||
            state is AdventureMoviesPaginationLoading ||
            state is AdventureMoviesPaginationFailure) {
          return AdventureMoviesView(
            adventureMovies:
                context.read<AdventureMoviesCubit>().currentAdventureMovies,
            scrollController:
                context.read<AdventureMoviesCubit>().scrollController,
          );
        } else if (state is AdventureMoviesFailure) {
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
        if (state is AdventureMoviesFailure) {
          showAnimatedSnackBar(
            message: state.errorMessage.toString(),
            context,
            type: AnimatedSnackBarType.error,
          );
        }

        if (state is AdventureMoviesPaginationFailure) {
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

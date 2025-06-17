import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/details_movies/presentation/views/widgets/layout/movies_details_mobile.dart';
import '../../../manager/movies_details_cubit/movies_details_cubit.dart';

class TabletDetailsMobileBlocConsumer extends StatelessWidget {
  const TabletDetailsMobileBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesDetailsCubit, MoviesDetailsState>(
      builder: (context, state) {
        if (state is MoviesDetailsSuccess || state is MoviesDetailsLoading) {
          return MoviesDetailsMobile(
            moviesDetailsEntity: context.read<MoviesDetailsCubit>().currentMoviesDetails[0],
            casts: context.read<MoviesDetailsCubit>().currentMoviesCasting,
          );
        } else if (state is MoviesDetailsFailure) {
          return Center(
            child: Text(
              "${state.errorMessage.toString()}😢",
            ),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: Colors.blueAccent.shade400,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

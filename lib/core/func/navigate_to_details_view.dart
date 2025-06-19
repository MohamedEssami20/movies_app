  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/details_movies/presentation/manager/movies_details_cubit/movies_details_cubit.dart';
import '../../features/details_movies/presentation/views/movies_details_view.dart';

void navigateToDetailsView(BuildContext context, int movieId) {
    final detailsCubit = context.read<MoviesDetailsCubit>();
    context.read<MoviesDetailsCubit>().getMoviesDetails(
          movieId: movieId,
        );
    Navigator.pushNamed(
      context,
      MoviesDetailsView.routeName,
      arguments: detailsCubit,
    );
  }

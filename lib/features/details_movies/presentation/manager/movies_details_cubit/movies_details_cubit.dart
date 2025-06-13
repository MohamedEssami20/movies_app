import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/details_movies/domain/repos/details_movies_repos.dart';

import '../../../domain/movies_details_entity/movies_casting_entity.dart';
import '../../../domain/movies_details_entity/movies_details_entity.dart';
part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit({required this.detailsMoviesRepos})
      : super(MoviesDetailsInitial());
  final DetailsMoviesRepos detailsMoviesRepos;

  // create method that get all details of  movie;
  Future<void> getMoviesDetails({required int movieId}) async {
    emit(MoviesDetailsLoading());
    final results = await detailsMoviesRepos.getMoviesDetails(movieId: movieId);
    final castingResults =
        await detailsMoviesRepos.getMoviesCasting(movieId: movieId);

    results.fold(
      (failure) {
        emit(MoviesDetailsFailure(errorMessage: failure.message));
      },
      (moviesDetails) {
        emit(
          MoviesDetailsSuccess(
            moviesDetailsEntity: moviesDetails,
          ),
        );
      },
    );
    castingResults.fold(
      (failure) {
        emit(MoviesDetailsFailure(errorMessage: failure.message));
      },
      (moviesCasting) {
        emit(
          MoviesCastingSuccess(
            moviesCastingEntity: moviesCasting,
          ),
        );
      },
    );
  }
}

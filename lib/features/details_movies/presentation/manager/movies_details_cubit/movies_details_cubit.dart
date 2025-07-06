import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/details_movies/domain/repos/details_movies_repos.dart';

import '../../../domain/movies_details_entity/movie_trailer_entity.dart';
import '../../../domain/movies_details_entity/movies_casting_entity.dart';
import '../../../domain/movies_details_entity/movies_details_entity.dart';
part 'movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState> {
  MoviesDetailsCubit({required this.detailsMoviesRepos})
      : super(MoviesDetailsInitial());
  final DetailsMoviesRepos detailsMoviesRepos;
  final List<MoviesDetailsEntity> currentMoviesDetails = [];
  final List<MoviesCastingEntity> currentMoviesCasting = [];
  // create method that get all details of  movie;
  Future<void> getMoviesDetails({required int movieId}) async {
    emit(MoviesDetailsLoading());
    final results = await detailsMoviesRepos.getMoviesDetails(movieId: movieId);
    final castingResults =
        await detailsMoviesRepos.getMoviesCasting(movieId: movieId);

    final failure = results.fold((f) => f, (r) => null) ??
        castingResults.fold((f) => f, (r) => null);

    if (failure != null) {
      emit(
        MoviesDetailsFailure(errorMessage: failure.message),
      );
    } else {
      currentMoviesCasting.clear();
      currentMoviesDetails.clear();
      currentMoviesDetails.addAll(results.getOrElse(() => []));
      currentMoviesCasting.addAll(castingResults.getOrElse(() => []));
      emit(MoviesDetailsSuccess(
        moviesDetailsEntity: currentMoviesDetails,
        moviesCastingEntity: currentMoviesCasting,
      ));
    }
  }

  // create method that get trailer from movies details;
  Future<void> getMoviesTrailer({required int movieId}) async {
    emit(MoviesTraillerLoading());
    final results =
        await detailsMoviesRepos.getMoviesTrailler(movieId: movieId);
    results.fold((failure) {
      emit(MoviesTraillerFailure(
        errorMessage: failure.message,
      ));
    }, (trailer) {
      emit(MoviesTraillerSuccess(
        movieTrailerEntity: trailer,
      ));
    });
  }
}

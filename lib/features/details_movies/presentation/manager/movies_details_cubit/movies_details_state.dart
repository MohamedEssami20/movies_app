part of 'movies_details_cubit.dart';

@immutable
sealed class MoviesDetailsState {}

final class MoviesDetailsInitial extends MoviesDetailsState {}

// create all state of movies details;

final class MoviesDetailsLoading extends MoviesDetailsState {}

final class MoviesDetailsFailure extends MoviesDetailsState {
  final String errorMessage;
  MoviesDetailsFailure({required this.errorMessage});
}

final class MoviesDetailsSuccess extends MoviesDetailsState {
  final List<MoviesDetailsEntity> moviesDetailsEntity;
  final List<MoviesCastingEntity> moviesCastingEntity;
  MoviesDetailsSuccess(
      {required this.moviesCastingEntity, required this.moviesDetailsEntity});
}

// create all state of get trailer from movies details;

final class MoviesTraillerLoading extends MoviesDetailsState {}

final class MoviesTraillerFailure extends MoviesDetailsState {
  final String errorMessage;
  MoviesTraillerFailure({required this.errorMessage});
}

final class MoviesTraillerSuccess extends MoviesDetailsState {
  final MovieTrailerEntity movieTrailerEntity;
  MoviesTraillerSuccess({required this.movieTrailerEntity});
}

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
  MoviesDetailsSuccess({required this.moviesDetailsEntity});
}

final class MoviesCastingSuccess extends MoviesDetailsState {
  final List<MoviesCastingEntity> moviesCastingEntity;
  MoviesCastingSuccess({required this.moviesCastingEntity});
}

part of 'romance_movies_cubit.dart';

@immutable
sealed class RomanceMoviesState {}

final class RomanceMoviesInitial extends RomanceMoviesState {}

// create all states of romance movies;
final class RomanceMoviesLoading extends RomanceMoviesState {}

final class RomanceMoviesSuccess extends RomanceMoviesState {
  final List<RomanceMoviesEntity> romanceMovies;
  RomanceMoviesSuccess({required this.romanceMovies});
}

final class RomanceMoviesFailure extends RomanceMoviesState {
  final String errorMessage;
  RomanceMoviesFailure({required this.errorMessage});
}

// create all states of pagination of romance movies;
final class RomanceMoviesPaginationSuccess extends RomanceMoviesState {
  final List<RomanceMoviesEntity> romanceMovies;
  RomanceMoviesPaginationSuccess({required this.romanceMovies});
}

final class RomanceMoviesPaginationFailure extends RomanceMoviesState {
  final String errorMessage;
  RomanceMoviesPaginationFailure({required this.errorMessage});
}

final class RomanceMoviesPaginationLoading extends RomanceMoviesState {}

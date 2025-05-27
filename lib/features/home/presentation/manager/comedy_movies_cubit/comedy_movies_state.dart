part of 'comedy_movies_cubit.dart';

@immutable
sealed class ComedyMoviesState {}

final class ComedyMoviesInitial extends ComedyMoviesState {}

// create all state of comedy movies;

final class ComedyMoviesLoading extends ComedyMoviesState {}

final class ComedyMoviesSuccess extends ComedyMoviesState {
  final List<ComedyMoviesEntity> comedyMovies;
  ComedyMoviesSuccess({required this.comedyMovies});
}

final class ComedyMoviesFailure extends ComedyMoviesState {
  final String errorMessage;
  ComedyMoviesFailure({required this.errorMessage});
}

// create all state of pagination of comedy movies;

final class ComedyMoviesPaginationLoading extends ComedyMoviesState {}

final class ComedyMoviesPaginationSuccess extends ComedyMoviesState {
  final List<ComedyMoviesEntity> comedyMovies;
  ComedyMoviesPaginationSuccess({required this.comedyMovies});
}

final class ComedyMoviesPaginationFailure extends ComedyMoviesState {
  final String errorMessage;
  ComedyMoviesPaginationFailure({required this.errorMessage});
}

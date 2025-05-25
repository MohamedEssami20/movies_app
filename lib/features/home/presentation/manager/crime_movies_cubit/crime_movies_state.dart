part of 'crime_movies_cubit.dart';

@immutable
sealed class CrimeMoviesState {}

final class CrimeMoviesInitial extends CrimeMoviesState {}

// create all states of crime movies;
final class CrimeMoviesSuccess extends CrimeMoviesState {
  final List<CrimeMoviesEntity> crimeMovies;
  CrimeMoviesSuccess({required this.crimeMovies});
}

final class CrimeMoviesFailure extends CrimeMoviesState {
  final String errorMessage;
  CrimeMoviesFailure({required this.errorMessage});
}

final class CrimeMoviesLoading extends CrimeMoviesState {}

// create all state of pagination of crime movies;
final class CrimeMoviesPaginationSuccess extends CrimeMoviesState {
  final List<CrimeMoviesEntity> crimeMovies;
  CrimeMoviesPaginationSuccess({required this.crimeMovies});
}

final class CrimeMoviesPaginationFailure extends CrimeMoviesState {
  final String errorMessage;
  CrimeMoviesPaginationFailure({required this.errorMessage});
}

final class CrimeMoviesPaginationLoading extends CrimeMoviesState {}

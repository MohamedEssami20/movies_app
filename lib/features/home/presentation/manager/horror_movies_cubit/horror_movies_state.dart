part of 'horror_movies_cubit.dart';

@immutable
sealed class HorrorMoviesState {}

final class HorrorMoviesInitial extends HorrorMoviesState {}

// create all states of Horror movies;
final class HorrorMoviesLoading extends HorrorMoviesState {}

final class HorrorMoviesSuccess extends HorrorMoviesState {
  final List<HorrorMoviesEntity> horrorMovies;
  HorrorMoviesSuccess({required this.horrorMovies});
}

final class HorrorMoviesFailure extends HorrorMoviesState {
  final String errorMessage;
  HorrorMoviesFailure({required this.errorMessage});
}

// create all states of pagination of Horror movies;
final class HorrorMoviesPaginationSuccess extends HorrorMoviesState {
  final List<HorrorMoviesEntity> horrorMovies;
  HorrorMoviesPaginationSuccess({required this.horrorMovies});
}

final class HorrorMoviesPaginationFailure extends HorrorMoviesState {
  final String errorMessage;
  HorrorMoviesPaginationFailure({required this.errorMessage});
}

final class HorrorMoviesPaginationLoading extends HorrorMoviesState {}

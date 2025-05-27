part of 'drama_movies_cubit.dart';

@immutable
sealed class DramaMoviesState {}

final class DramaMoviesInitial extends DramaMoviesState {}

// create all state of drama movies;
final class DramaMoviesSuccess extends DramaMoviesState {
  final List<DramaMoviesEntity> dramaMovies;
  DramaMoviesSuccess({
    required this.dramaMovies,
  });
}

final class DramaMoviesFailure extends DramaMoviesState {
  final String errorMessage;
  DramaMoviesFailure({
    required this.errorMessage,
  });
}

final class DramaMoviesLoading extends DramaMoviesState {}

// create all state of pagination of drama movies;
final class DramaMoviesPaginationSuccess extends DramaMoviesState {
  final List<DramaMoviesEntity> dramaMovies;
  DramaMoviesPaginationSuccess({
    required this.dramaMovies,
  });
}

final class DramaMoviesPaginationFailure extends DramaMoviesState {
  final String errorMessage;
  DramaMoviesPaginationFailure({
    required this.errorMessage,
  });
}

final class DramaMoviesPaginationLoading extends DramaMoviesState {}

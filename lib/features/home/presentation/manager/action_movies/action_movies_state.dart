part of 'action_movies_cubit.dart';

@immutable
sealed class ActionMoviesState {}

final class ActionMoviesInitial extends ActionMoviesState {}

// create all states of action movies;
final class ActionMoviesLoading extends ActionMoviesState {}

final class ActionMoviesSuccess extends ActionMoviesState {
  final List<ActionMoviesEntity> actionMovies;

  ActionMoviesSuccess({required this.actionMovies});
}

final class ActionMoviesFailure extends ActionMoviesState {
  final String errorMessage;

  ActionMoviesFailure({required this.errorMessage});
}

// create all states of pagination of action movies;
final class ActionMoviesPaginationLoading extends ActionMoviesState {}

final class ActionMoviesPaginationSuccess extends ActionMoviesState {
  final List<ActionMoviesEntity> actionMovies;

  ActionMoviesPaginationSuccess({required this.actionMovies});
}

final class ActionMoviesPaginationFailure extends ActionMoviesState {
  final String errorMessage;

  ActionMoviesPaginationFailure({required this.errorMessage});
}

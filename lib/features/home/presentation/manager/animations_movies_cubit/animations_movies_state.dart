part of 'animations_movies_cubit.dart';

@immutable
sealed class AnimationsMoviesState {}

final class AnimationsMoviesInitial extends AnimationsMoviesState {}

// crate all state of animations movies;
final class AnimationsMoviesSuccess extends AnimationsMoviesState {
  final List<AnimationsMoviesEntity> animationsMovies;
  AnimationsMoviesSuccess({required this.animationsMovies});
}

final class AnimationsMoviesFailure extends AnimationsMoviesState {
  final String errorMessage;
  AnimationsMoviesFailure({required this.errorMessage});
}

final class AnimationsMoviesLoading extends AnimationsMoviesState {}

// create all state of pagination of animations movies;
final class AnimationsMoviesPaginationLoading extends AnimationsMoviesState {}

final class AnimationsMoviesPaginationSuccess extends AnimationsMoviesState {
  final List<AnimationsMoviesEntity> animationsMovies;
  AnimationsMoviesPaginationSuccess({required this.animationsMovies});
}

final class AnimationsMoviesPaginationFailure extends AnimationsMoviesState {
  final String errorMessage;
  AnimationsMoviesPaginationFailure({required this.errorMessage});
}

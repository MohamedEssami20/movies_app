part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

// creat all state of now playing movies;
final class NowPlayingMoviesLoading extends MoviesState {}

final class NowPlayingMoviesFailure extends MoviesState {
  final String errorMessage;

  NowPlayingMoviesFailure({required this.errorMessage});
}

final class NowPlayingMoviesSuccess extends MoviesState {
  final List<NowPlayingEntity> nowPlayingEntity;

  NowPlayingMoviesSuccess({required this.nowPlayingEntity});
}

// create all states of Popular movies;
final class PopularMoviesLoading extends MoviesState {}

final class PopularMoviesSuccess extends MoviesState {
  final List<PopularMoviesEntity> popularMovies;

  PopularMoviesSuccess({required this.popularMovies});
}

final class PopularMoviesFailure extends MoviesState {
  final String errorMessage;

  PopularMoviesFailure({required this.errorMessage});
}

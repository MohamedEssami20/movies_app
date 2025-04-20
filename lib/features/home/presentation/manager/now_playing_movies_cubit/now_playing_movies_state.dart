part of 'now_playing_movies_cubit.dart';

@immutable
sealed class NowPlayingMoviesState {}

final class MoviesInitial extends NowPlayingMoviesState {}

// creat all state of now playing movies;
final class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

final class NowPlayingMoviesFailure extends NowPlayingMoviesState {
  final String errorMessage;

  NowPlayingMoviesFailure({required this.errorMessage});
}

final class NowPlayingMoviesSuccess extends NowPlayingMoviesState {
  final List<NowPlayingEntity> nowPlayingEntity;

  NowPlayingMoviesSuccess({required this.nowPlayingEntity});
}

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

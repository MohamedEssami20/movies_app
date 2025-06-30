part of 'watch_list_movies_cubit.dart';

@immutable
sealed class WatchListMoviesState {}

final class WatchListMoviesInitial extends WatchListMoviesState {}

// create all State of add movies to watch list
final class AddWatchListMoviesSuccess extends WatchListMoviesState {}

final class AddWatchListMoviesFailure extends WatchListMoviesState {
  final String errorMessage;
  AddWatchListMoviesFailure({required this.errorMessage});
}

final class AddWatchListMoviesLoading extends WatchListMoviesState {}

// create all state of get movies from watch list
final class GetWatchListMoviesSuccess extends WatchListMoviesState {
  final List<WatchListEntity> watchListMovies;

  GetWatchListMoviesSuccess({required this.watchListMovies});
}

final class GetWatchListMoviesFailure extends WatchListMoviesState {
  final String errorMessage;
  GetWatchListMoviesFailure({required this.errorMessage});
}

final class GetWatchListMoviesLoading extends WatchListMoviesState {}

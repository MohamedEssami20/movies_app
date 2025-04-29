part of 'trending_movies_cubit.dart';

@immutable
sealed class TrendingMoviesState {}

final class TrendingMoviesInitial extends TrendingMoviesState {}

// create all get trending movies states;
final class TrendingMoviesSuccess extends TrendingMoviesState {
  final List<TrendingMoviesEntity> trendingMoviesEntityList;
  TrendingMoviesSuccess({required this.trendingMoviesEntityList});
}

final class TrendingMoviesFailure extends TrendingMoviesState {
  final String errorMessage;

  TrendingMoviesFailure({required this.errorMessage});
}

final class TrendingMoviesLoading extends TrendingMoviesState {}

// create all state of pagination of trending movies;
final class TrendingMoviesPaginationLoading extends TrendingMoviesState {}

final class TrendingMoviesPaginationFailure extends TrendingMoviesState {
  final String errorMessage;
  TrendingMoviesPaginationFailure({required this.errorMessage});
}

final class TrendingMoviesPaginationSuccess extends TrendingMoviesState {
  final List<TrendingMoviesEntity> trendingMoviesEntityList;
  TrendingMoviesPaginationSuccess({required this.trendingMoviesEntityList});
}
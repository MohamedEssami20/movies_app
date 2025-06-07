part of 'search_cubit.dart';

@immutable
sealed class SearchMoviesState {}

final class SearchMoviesInitial extends SearchMoviesState {}

// create all state of search;
final class SearchMoviesSuccess extends SearchMoviesState {
  final List<SearchMoviesEntity> searchMovies;
  SearchMoviesSuccess({required this.searchMovies});
}

final class SearchMoviesFailure extends SearchMoviesState {
  final String errorMessage;
  SearchMoviesFailure({required this.errorMessage});
}

final class SearchMoviesLoading extends SearchMoviesState {}

// create all state of pagination of search;
final class SearchMoviesPaginationSuccess extends SearchMoviesState {
  final List<SearchMoviesEntity> searchMovies;
  SearchMoviesPaginationSuccess({required this.searchMovies});
}

final class SearchMoviesPaginationFailure extends SearchMoviesState {
  final String errorMessage;
  SearchMoviesPaginationFailure({required this.errorMessage});
}

final class SearchMoviesPaginationLoading extends SearchMoviesState {}

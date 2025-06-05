part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

// create all state of search;
final class SearchSuccess extends SearchState {
  final List<SearchMoviesEntity> searchMovies;
  SearchSuccess({required this.searchMovies});
}

final class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({required this.errorMessage});
}

final class SearchLoading extends SearchState {}

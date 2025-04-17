part of 'popular_movies_cubit.dart';

@immutable
sealed class PopularMoviesState {}

final class PopularMoviesInitial extends PopularMoviesState {}
// create all states of Popular movies;
final class PopularMoviesLoading extends PopularMoviesState {}

final class PopularMoviesSuccess extends PopularMoviesState {
  final List<PopularMoviesEntity> popularMovies;

  PopularMoviesSuccess({required this.popularMovies});
}

final class PopularMoviesFailure extends PopularMoviesState {
  final String errorMessage;

  PopularMoviesFailure({required this.errorMessage});
}

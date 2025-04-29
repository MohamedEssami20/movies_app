part of 'up_coming_movies_cubit.dart';

@immutable
sealed class UpComingMoviesState {}

final class UpComingMoviesInitial extends UpComingMoviesState {}

// creat all state of up coming movies;
final class UpComingMoviesSuccess extends UpComingMoviesState {
  final List<UpComingMoviesEntity> upComingMovies;
  UpComingMoviesSuccess({required this.upComingMovies});
}

final class UpComingMoviesFailure extends UpComingMoviesState {
  final String errorMessage;
  UpComingMoviesFailure({required this.errorMessage});
}

final class UpComingMoviesLoading extends UpComingMoviesState {}

// create all state of pagination of up coming movies;
final class UpComingMoviesPaginationSuccess extends UpComingMoviesState {
  final List<UpComingMoviesEntity> upComingMovies;
  UpComingMoviesPaginationSuccess({required this.upComingMovies});
}

final class UpComingMoviesPaginationFailure extends UpComingMoviesState {
  final String errorMessage;
  UpComingMoviesPaginationFailure({required this.errorMessage});
}

final class UpComingMoviesPaginationLoading extends UpComingMoviesState {}

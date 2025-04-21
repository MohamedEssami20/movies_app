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
  final String message;
  UpComingMoviesFailure({required this.message});
}

final class UpComingMoviesLoading extends UpComingMoviesState {}
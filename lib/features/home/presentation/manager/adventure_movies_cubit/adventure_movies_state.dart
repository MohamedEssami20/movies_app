part of 'adventure_movies_cubit.dart';

@immutable
sealed class AdventureMoviesState {}

final class AdventureMoviesInitial extends AdventureMoviesState {}

// create all state of adventure movies;

final class AdventureMoviesLoading extends AdventureMoviesState {}

final class AdventureMoviesSuccess extends AdventureMoviesState {
  final List<AdventureMoviesEntity> adventureMovies;
  AdventureMoviesSuccess({required this.adventureMovies});
}

final class AdventureMoviesFailure extends AdventureMoviesState {
  final String errorMessage;
  AdventureMoviesFailure({required this.errorMessage});
}

// create all state of pagination of adventure movies;

final class AdventureMoviesPaginationLoading extends AdventureMoviesState {}

final class AdventureMoviesPaginationSuccess extends AdventureMoviesState {
  final List<AdventureMoviesEntity> adventureMovies;
  AdventureMoviesPaginationSuccess({required this.adventureMovies});
}

final class AdventureMoviesPaginationFailure extends AdventureMoviesState {
  final String errorMessage;
  AdventureMoviesPaginationFailure({required this.errorMessage});
}

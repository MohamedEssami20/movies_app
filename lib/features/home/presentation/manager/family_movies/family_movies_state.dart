part of 'family_movies_cubit.dart';

@immutable
sealed class FamilyMoviesState {}

final class FamilyMoviesInitial extends FamilyMoviesState {}

// create all states of family movies;
final class FamilyMoviesSuccess extends FamilyMoviesState {
  final List<FamilyMoviesEntity> familyMovies;
  FamilyMoviesSuccess({required this.familyMovies});
}

final class FamilyMoviesFailure extends FamilyMoviesState {
  final String errorMessage;
  FamilyMoviesFailure({required this.errorMessage});
}

final class FamilyMoviesLoading extends FamilyMoviesState {}

// create all state of pagination of family movies;
final class FamilyMoviesPaginationSuccess extends FamilyMoviesState {
  final List<FamilyMoviesEntity> familyMovies;
  FamilyMoviesPaginationSuccess({required this.familyMovies});
}

final class FamilyMoviesPaginationLoading extends FamilyMoviesState {}

final class FamilyMoviesPaginationFailure extends FamilyMoviesState {
  final String errorMessage;
  FamilyMoviesPaginationFailure({required this.errorMessage});
}

part of 'top_rating_movies_cubit.dart';

@immutable
sealed class TopRatingMoviesState {}

final class TopRatingMoviesInitial extends TopRatingMoviesState {}
//create all states of top rating movies;

final class TopRatingMoviesLoading extends TopRatingMoviesState {}

final class TopRatingMoviesSuccess extends TopRatingMoviesState {
  final List<TopRatingMoviesEntity> topRatingMoviesEntityList;
  TopRatingMoviesSuccess({required this.topRatingMoviesEntityList});
}

final class TopRatingMoviesFailure extends TopRatingMoviesState {
  final String errorMessage;
  TopRatingMoviesFailure({required this.errorMessage});
}

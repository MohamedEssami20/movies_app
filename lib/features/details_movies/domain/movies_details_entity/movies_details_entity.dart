import 'package:movies_app/core/utils/api_end_points.dart';

class MoviesDetailsEntity {
  final int movieId;
  final String movieImage;
  final String movieTitle;
  final List<String> movieGenres;
  final int movieDuration;
  final String moiveDate;
  final double movieRating;
  final int movieVoteCount;
  final String movieOverview;
  final List<dynamic> movieOriginCountry;
  final String movieDateRelease;
  final List<String> movieProductionCompanies;

  MoviesDetailsEntity(
    this.movieId, {
    required this.movieImage,
    required this.movieTitle,
    required this.movieGenres,
    required this.movieDuration,
    required this.moiveDate,
    required this.movieRating,
    required this.movieVoteCount,
    required this.movieOverview,
    required this.movieOriginCountry,
    required this.movieDateRelease,
    required this.movieProductionCompanies,
  });

  // create method that return map to use it to upload to fireStore;
  Map<String, dynamic> toFireStore() => {
        'id': movieId,
        'title': movieTitle,
        'poster_path': ApiEndPoints.imagebaseUrl + movieImage,
        'release_date': movieDateRelease,
        'vote_average': movieRating,
        'runtime': movieDuration,
        'genres': movieGenres
      };
}

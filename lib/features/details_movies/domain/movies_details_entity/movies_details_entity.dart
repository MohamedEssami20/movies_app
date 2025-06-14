import 'package:movies_app/features/details_movies/data/models/movies_details_model/genre.dart';
import 'package:movies_app/features/details_movies/data/models/movies_details_model/production_company.dart';

class MoviesDetailsEntity {
  final String movieImage;
  final String movieTitle;
  final List<Genre> movieGenres;
  final int movieDuration;
  final String moiveDate;
  final double movieRating;
  final int movieVoteCount;
  final String movieOverview;
  final List<dynamic> movieOriginCountry;
  final String movieDateRelease;
  final List<ProductionCompany> movieProductionCompanies;

  MoviesDetailsEntity({
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
}

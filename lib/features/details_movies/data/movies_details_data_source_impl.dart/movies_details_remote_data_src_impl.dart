import 'package:movies_app/core/services/api_services.dart';
import 'package:movies_app/features/details_movies/data/models/movies.casting.model.dart';
import 'package:movies_app/features/details_movies/data/movies_details_data_source/movies_details_remote_data_src.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movie_trailer_entity.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_casting_entity.dart';
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_details_entity.dart';
import '../models/movie_trailer_model/movie_trailer_model.dart';
import '../models/movies_details_model/movies_details_model.dart'
    show MoviesDetailsModel;

class MoviesDetailsRemoteDataSrcImpl implements MoviesDetailsRemoteDataSource {
  final ApiServices apiServices;
  MoviesDetailsRemoteDataSrcImpl({required this.apiServices});

  @override

  // implementation of getMoviesDetails;
  Future<List<MoviesDetailsEntity>> getMoviesDetails(
      {required int movieId}) async {
    final List<MoviesDetailsEntity> moviesDetails = [];
    final Map<String, dynamic> results =
        await apiServices.get("movie/$movieId?language=en-US");
    moviesDetails.add(MoviesDetailsModel.fromJson(results));
    return moviesDetails;
  }

  // implementation of getMoviesCasting;
  @override
  Future<List<MoviesCastingEntity>> getMoviesCasting(
      {required int movieId}) async {
    final List<MoviesCastingEntity> moviesCasting = [];
    final Map<String, dynamic> results =
        await apiServices.get("movie/$movieId/credits?language=en-US");
    for (Map<String, dynamic> casting in results['cast']) {
      moviesCasting.add(
        MoviesCastingModel.fromJson(casting),
      );
    }
    return moviesCasting;
  }

  // implementation of getMoviesTrailer;
  @override
  Future<List<MovieTrailerEntity>> getMoviesTrailer(
      {required int movieId}) async {
    List<MovieTrailerEntity> moviesTrailer = [];
    final Map<String, dynamic> results =
        await apiServices.get("movie/$movieId/videos?language=en-US");
    for (Map<String, dynamic> trailer in results['results']) {
      moviesTrailer.add(
        MovieTrailerModel.fromJson(trailer),
      );
    }
    return moviesTrailer.every(
      (key) => key.movieSite.contains("YouTube") && key.siteType == "Trailer",
    )
        ? moviesTrailer
        : moviesTrailer
            .where(
              (key) =>
                  key.movieSite.contains("YouTube") &&
                  key.siteType == "Trailer",
            )
            .toList();
  }
}

import 'package:movies_app/features/details_movies/domain/movies_details_entity/movie_trailer_entity.dart';

import '../../domain/movies_details_entity/movies_casting_entity.dart'
    show MoviesCastingEntity;
import '../../domain/movies_details_entity/movies_details_entity.dart'
    show MoviesDetailsEntity;

abstract class MoviesDetailsRemoteDataSource {
  // create method that get details of movies from api;

  Future<List<MoviesDetailsEntity>> getMoviesDetails({required int movieId});

  // create method that get casting of movies from api;
  Future<List<MoviesCastingEntity>> getMoviesCasting({required int movieId});

  // create method that get trailer of movies from api;
  Future<List<MovieTrailerEntity>> getMoviesTrailer({required int movieId});
}

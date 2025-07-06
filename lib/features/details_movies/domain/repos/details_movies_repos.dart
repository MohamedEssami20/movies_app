import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart' show Failure;
import 'package:movies_app/features/details_movies/domain/movies_details_entity/movie_trailer_entity.dart';

import '../movies_details_entity/movies_casting_entity.dart';
import '../movies_details_entity/movies_details_entity.dart';

abstract class DetailsMoviesRepos {
  // create method to get movies details;
  Future<Either<Failure, List<MoviesDetailsEntity>>> getMoviesDetails(
      {required int movieId});

  // create method to get movies casting;
  Future<Either<Failure, List<MoviesCastingEntity>>> getMoviesCasting(
      {required int movieId});
  
  // create method to get movies trailler ;
  Future<Either<Failure,MovieTrailerEntity>> getMoviesTrailler(
      {required int movieId});
}

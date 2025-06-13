
import '../../domain/movies_details_entity/movies_casting_entity.dart' show MoviesCastingEntity;
import '../../domain/movies_details_entity/movies_details_entity.dart' show MoviesDetailsEntity;

abstract class MoviesDetailsRemoteDataSource {
  // create method that get details of movies from api;

  Future <List<MoviesDetailsEntity>> getMoviesDetails({required int movieId});

  // create method that get casting of movies from api;
  Future<List<MoviesCastingEntity>> getMoviesCasting({required int movieId});
}

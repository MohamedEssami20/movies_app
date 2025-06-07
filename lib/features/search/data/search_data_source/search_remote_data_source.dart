import '../../domain/entities/search_movies_entity/search_movies_entity.dart';

abstract class SearchRemoteDataSource {

  // create method that search movies;

  Future<List<SearchMoviesEntity>> searchMovies({required String query, int pageNumber = 1});
}
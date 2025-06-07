import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';

import '../entities/search_movies_entity/search_movies_entity.dart';

abstract class SearchRepos {
  Future<Either<Failure, List<SearchMoviesEntity>>> getSearchMovies(
      {required String query, int pageNumber = 1});
}

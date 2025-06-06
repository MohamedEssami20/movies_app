import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/api_server_errors.dart';

import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/search/data/search_data_source/search_remote_data_source.dart';

import 'package:movies_app/features/search/domain/entities/search_movies_entity/search_movies_entity.dart';

import '../../domain/search_repos/search_repos.dart';

class SearchReposImpl implements SearchRepos {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchReposImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failure, List<SearchMoviesEntity>>> getSearchMovies(
      {required String query}) async {
    try {
      final result = await searchRemoteDataSource.searchMovies(query: query);
      return right(result);
    } on DioException catch (error) {
      log("search error from api is= $error");
      return left(
        ApiServerErrors.fromDioError(error),
      );
    } on Exception {
      return left(Failure("Opps there was an error, try later."));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/details_movies/data/movies_details_data_source/movies_details_remote_data_src.dart';

import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_casting_entity.dart';

import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_details_entity.dart';

import '../../../../core/errors/api_server_errors.dart';
import '../../domain/repos/details_movies_repos.dart';

class MoviesDetailsRepoImpl implements DetailsMoviesRepos {
  final MoviesDetailsRemoteDataSource moviesDetailsRemoteDataSource;
  @override
  MoviesDetailsRepoImpl({required this.moviesDetailsRemoteDataSource});

  // imolement DetailsMoviesRepos;
  @override
  Future<Either<Failure, List<MoviesDetailsEntity>>> getMoviesDetails(
      {required int movieId}) async {
    try {
      final results = await moviesDetailsRemoteDataSource.getMoviesDetails(
          movieId: movieId);
      return right(results);
    } on DioException catch (error) {
      return left(
        ApiServerErrors.fromDioError(error),
      );
    } catch (error) {
      return left(
        Failure("Opps there was an error, try later."),
      );
    }
  }

  // implementation Casting movies repos;
  @override
  Future<Either<Failure, List<MoviesCastingEntity>>> getMoviesCasting(
      {required int movieId}) async {
    try {
      final results = await moviesDetailsRemoteDataSource.getMoviesCasting(
          movieId: movieId);
      return right(results);
    } on DioException catch (error) {
      return left(
        ApiServerErrors.fromDioError(error),
      );
    } catch (error) {
      return left(
        Failure("Opps there was an error, try later."),
      );
    }
  }
}

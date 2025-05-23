// creat method that get movies from api and local storage ;
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure.dart';
import '../errors/api_server_errors.dart';

Future<Either<Failure, List<T>>> getMoviesDataImpl<T>({
  required Future<List<T>> homeRemoteDataSource,
  required List<T> homeLocalDataSource,
}) async {
  List<T> moviesEntity;
  try {
    moviesEntity = await homeRemoteDataSource;
    return right(moviesEntity);
  } on DioException catch (error) {
    log(" error from api is= $error");
    moviesEntity = homeLocalDataSource;
    if (moviesEntity.isNotEmpty) {
      return right(moviesEntity);
    } else {
      return left(
        ApiServerErrors.fromDioError(error),
      );
    }
  } catch (error) {
    moviesEntity = homeLocalDataSource;
    if (moviesEntity.isNotEmpty) {
      return right(moviesEntity);
    }
    log(" error is= $error");
    return Left(
      Failure("Opps there was an error, try later."),
    );
  }
}

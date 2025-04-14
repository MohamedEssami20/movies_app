// creat method that get movies from api and local storage ;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure.dart';
import '../errors/api_server_errors.dart';

Future<Either<Failure, List<T>>> getMoviesDataImpl<T>({
  required Future<List<T>> homeRemoteDataSource,
  required List<T> homeLocalDataSource,
}) async {
  List<T> nowPlayingEntity;
  try {
    nowPlayingEntity = await homeRemoteDataSource;
    return right(nowPlayingEntity);
  } on DioException catch (error) {
    nowPlayingEntity = homeLocalDataSource;
    if (nowPlayingEntity.isNotEmpty) {
      return right(nowPlayingEntity);
    } else {
      return left(
        ApiServerErrors.fromDioError(error),
      );
    }
  } catch (error) {
    nowPlayingEntity = homeLocalDataSource;
    return Left(
      Failure("Opps there was an error, try later."),
    );
  }
}

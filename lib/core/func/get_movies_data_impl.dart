// creat method that get movies from api and local storage ;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure.dart';

import '../../features/home/domain/entities/now_playing_entity.dart';
import '../errors/api_server_errors.dart';

Future<Either<Failure, List<NowPlayingEntity>>> getMoviesDataImpl({
  required Future<List<NowPlayingEntity>> homeRemoteDataSource,
  required List<NowPlayingEntity> homeLocalDataSource,
}) async {
  List<NowPlayingEntity> nowPlayingEntity;
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
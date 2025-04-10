import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';
import '../../../../core/errors/api_server_errors.dart';

class HomeReposImpl implements HomeRepos {
  HomeRemoteDataSource homeDataSourceRepos;
  HomeReposImpl({required this.homeDataSourceRepos});
  @override
  Future<Either<Failure, List<NowPlayingEntity>>> getNowPlayingMovies() async {
    try {
      final result = await homeDataSourceRepos.getNowPlayingMovies();
      return right(result);
    } on DioException catch (error) {
      log("Dio error= ${error.toString()}");
      return left(
        ApiServerErrors.fromDioError(error),
      );
    } catch (error) {
      log("global error= ${error.toString()}");
      return Left(
        Failure("Opps there was an error, try later."),
      );
    }
  }
}

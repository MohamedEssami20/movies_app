import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source_repos.dart';
import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/utils/api_end_points.dart';
import '../models/now_playing_movies_model.dart';

class HomeDataSourceImpl implements HomeDataSourceRepos {
  final ApiServices apiServices;

  HomeDataSourceImpl({required this.apiServices});
  @override
  Future<Either<Failure, NowPlayingEntity>> getNowPlayingMovies() async {
    try {
      final result = await apiServices.get(ApiEndPoints.nowPlayingMovies);
      NowPlayingEntity nowPlayingEntity =
          NowPlayingMoviesModel.fromJson(result);
      return Right(nowPlayingEntity);
    } catch (e) {
      return Left(
        Failure("Opps, there was an error."),
      );
    }
  }
}

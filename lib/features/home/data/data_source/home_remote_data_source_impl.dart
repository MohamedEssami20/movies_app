import 'package:movies_app/core/utils/constant.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';
import '../../../../core/func/save_movies_local.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/utils/api_end_points.dart';
import '../models/now_playing_movies_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<NowPlayingEntity>> getNowPlayingMovies() async {
    final result = await apiServices.get(ApiEndPoints.nowPlayingMovies);
    List<NowPlayingEntity> nowPlayingEntity = [];
    for (var movies in result['results']) {
      nowPlayingEntity.add(NowPlayingMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
        results: nowPlayingEntity, boxName: AppConstants.nowPlayingKey);
    return nowPlayingEntity;
  }

  @override
  Future<List<NowPlayingEntity>> getTrendingMovies() {
    throw UnimplementedError();
  }
}

import 'package:movies_app/core/utils/constant.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';
import '../../../../core/func/save_movies_local.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/utils/api_end_points.dart';
import '../../domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';
import '../models/action_movies_model.dart';
import '../models/now_playing_movies_model.dart';
import '../models/popular_movies_model.dart';
import '../models/top_rating_movies_model.dart';
import '../models/trending_movies_model.dart';
import '../models/up_coming_movies_model.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl({required this.apiServices});

  // create method that get Now Playing movies from data source;
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

  // ceate method that get trending movies form data source;
  @override
  Future<List<PopularMoviesEntity>> getPopularMovies(
      {int pageNumber = 1}) async {
    List<PopularMoviesEntity> popularMoviesEntity = [];
    final results =
        await apiServices.get("${ApiEndPoints.popularMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      popularMoviesEntity.add(PopularMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
        boxName: AppConstants.popularMovieKey, results: popularMoviesEntity);
    return popularMoviesEntity;
  }

  // implement get trending movies;
  @override
  Future<List<TrendingMoviesEntity>> getTrendingMovies(
      {int pageNumber = 1}) async {
    List<TrendingMoviesEntity> trendingMoviesEntity = [];
    final results = await apiServices
        .get("${ApiEndPoints.trendingMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      trendingMoviesEntity.add(TrendingMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
        boxName: AppConstants.trendingMovieKey, results: trendingMoviesEntity);
    return trendingMoviesEntity;
  }

  // implementation get top rated movies;
  @override
  Future<List<TopRatingMoviesEntity>> getTopRatedMovies(
      {int pageNumber = 1}) async {
    List<TopRatingMoviesEntity> topRatingMovies = [];
    final results = await apiServices
        .get("${ApiEndPoints.topRatedMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      topRatingMovies.add(TopRatingMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
        boxName: AppConstants.topRatingMovieKey, results: topRatingMovies);
    return topRatingMovies;
  }

  //implementation get upcoming movies;
  @override
  Future<List<UpComingMoviesEntity>> getUpcomingMovies(
      {int pageNumber = 1}) async {
    final List<UpComingMoviesEntity> upComingMovies = [];
    final results = await apiServices
        .get("${ApiEndPoints.upComingMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      upComingMovies.add(UpComingMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
      boxName: AppConstants.upComingMoviesKey,
      results: upComingMovies,
    );
    return upComingMovies;
  }

  // implementation get action movies ;
  @override
  Future<List<ActionMoviesEntity>> getActionMovies({int pageNumber = 1}) async {
    final List<ActionMoviesEntity> actionMovies = [];
    final results = await apiServices
        .get("${ApiEndPoints.actionMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      actionMovies.add(ActionMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
      boxName: AppConstants.actionMoviesKey,
      results: actionMovies,
    );
    return actionMovies;
  }
}

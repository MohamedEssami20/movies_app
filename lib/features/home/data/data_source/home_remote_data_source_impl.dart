import 'package:movies_app/core/utils/constant.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/adventure_movies_entity/adventure_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/animations_movies_entity/animations_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/comedy_movies_entity/comedy_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/crime_movies_entity/crime_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/drama_movies_entity/drama_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/family_movies_entity/family_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/horror_movies_entity/horror_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/romance_movies_entity/romance_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';
import '../../../../core/func/save_movies_local.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/utils/api_end_points.dart';
import '../../domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';
import '../models/action_movies_model.dart';
import '../models/adventure_movies_model.dart';
import '../models/animation_movies_model.dart';
import '../models/comedy_movies_model.dart';
import '../models/crime_movies_model.dart';
import '../models/drama_movies_model.dart';
import '../models/family_movies_model.dart';
import '../models/horror_movies_model.dart';
import '../models/now_playing_movies_model.dart';
import '../models/popular_movies_model.dart';
import '../models/romance_movies_model.dart';
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
    final results =
        await apiServices.get("${ApiEndPoints.actionMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      actionMovies.add(ActionMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
      boxName: AppConstants.actionMoviesKey,
      results: actionMovies,
    );
    return actionMovies;
  }

  // implementation get adventure movies;
  @override
  Future<List<AdventureMoviesEntity>> getAdventureMovies({int pageNumber = 1})async {
   final List<AdventureMoviesEntity> adventureMovies = [];
   final results =await apiServices.get("${ApiEndPoints.adventureMovies}&page=$pageNumber");
   for(var movies in results['results']){
     adventureMovies.add(AdventureMoviesModel.fromJson(movies));
   }
   await saveMoviesLocal(
     boxName: AppConstants.adventureMoviesKey,
     results: adventureMovies,
   );
   return adventureMovies;
  }
  
  // implementation get animation movies
  @override
  Future<List<AnimationsMoviesEntity>> getAnimationsMovies({int pageNumber = 1})async {
    final List<AnimationsMoviesEntity> animationsMovies = [];
    final results =
       await apiServices.get("${ApiEndPoints.animationMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      animationsMovies.add(AnimationMoviesModel.fromJson(movies));
    }
    saveMoviesLocal(
      boxName: AppConstants.animationMoviesKey,
      results: animationsMovies,
    );
    return animationsMovies;
  }

  @override
  Future<List<ComedyMoviesEntity>> getComedyMovies({int pageNumber = 1}) async{
    final List<ComedyMoviesEntity> comedyMovies = [];
    final results =
        await apiServices.get("${ApiEndPoints.comdyMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      comedyMovies.add(ComedyMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
      boxName: AppConstants.comedyMoviesKey,
      results: comedyMovies,
    );
    return comedyMovies;
  }

  @override
  Future<List<CrimeMoviesEntity>> getCrimeMovies({int pageNumber = 1})async {
    final List<CrimeMoviesEntity> crimeMovies = [];
    final results =
        await apiServices.get("${ApiEndPoints.crimeMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      crimeMovies.add(CrimeMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
      boxName: AppConstants.crimeMoviesKey,
      results: crimeMovies,
    );
    return crimeMovies;
  }

  @override
  Future<List<DramaMoviesEntity>> getDramaMovies({int pageNumber = 1}) async{
    final List<DramaMoviesEntity> dramaMovies = [];
    final results =
        await apiServices.get("${ApiEndPoints.dramaMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      dramaMovies.add(DramaMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
      boxName: AppConstants.dramaMoviesKey,
      results: dramaMovies,
    );
    return dramaMovies;
  }

  @override
  Future<List<FamilyMoviesEntity>> getFamilyMovies({int pageNumber = 1}) async{
    final List<FamilyMoviesEntity> familyMovies = [];
    final results =
        await apiServices.get("${ApiEndPoints.familyMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      familyMovies.add(FamilyMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
      boxName: AppConstants.familyMoviesKey,
      results: familyMovies,
    );
    return familyMovies;
  }

  @override
  Future<List<HorrorMoviesEntity>> getHorrorMovies({int pageNumber = 1})async {
    final List<HorrorMoviesEntity> horrorMovies = [];
    final results =
        await apiServices.get("${ApiEndPoints.horrorMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      horrorMovies.add(HorrorMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
      boxName: AppConstants.horrorMoviesKey,
      results: horrorMovies,
    );
    return horrorMovies;
  }

  @override
  Future<List<RomanceMoviesEntity>> getRomanceMovies({int pageNumber = 1}) async{
    final List<RomanceMoviesEntity> romanceMovies = [];
    final results =
        await apiServices.get("${ApiEndPoints.romanceMovies}&page=$pageNumber");
    for (var movies in results['results']) {
      romanceMovies.add(RomanceMoviesModel.fromJson(movies));
    }
    await saveMoviesLocal(
      boxName: AppConstants.romanceMoviesKey,
      results: romanceMovies,
    );
    return romanceMovies;
  }
}

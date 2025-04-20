import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';

import '../../domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';

abstract class HomeRemoteDataSource {
  // create method that get now playing movies from api services;
  Future<List<NowPlayingEntity>> getNowPlayingMovies();
  // create method that get popular movies from api services;
  Future<List<PopularMoviesEntity>> getPopularMovies();
  //create method that get trending movies frome api services;
  Future<List<TrendingMoviesEntity>> getTrendingMovies();
}

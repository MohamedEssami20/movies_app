import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';

import '../../domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';

abstract class HomeRemoteDataSource {
  // create method that get now playing movies from api services;
  Future<List<NowPlayingEntity>> getNowPlayingMovies();

  // create method that get popular movies from api services;
  Future<List<PopularMoviesEntity>> getPopularMovies({int pageNumber = 1});

  //create method that get trending movies frome api services;
  Future<List<TrendingMoviesEntity>> getTrendingMovies({int pageNumber= 1});

  // create method that get top rating movies from api;
  Future<List<TopRatingMoviesEntity>> getTopRatedMovies({int pageNumber=1});

  // create method that get upcoming movies from api;
  Future<List<UpComingMoviesEntity>> getUpcomingMovies({int pageNumber=1});
}

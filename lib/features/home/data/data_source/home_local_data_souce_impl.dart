import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';

import '../../../../core/utils/constant.dart';
import 'home_local_data_source.dart';

class HomeLocalDataSouceImpl implements HomeLocalDataSource {
  // implementaion of get now playing from local storage;
  @override
  List<NowPlayingEntity> getNowPlayingMovies() {
    Box<NowPlayingEntity> box =
        Hive.box<NowPlayingEntity>(AppConstants.nowPlayingKey);
    return box.values.toList();
  }

  // implementation of get trending movies from local storage;
  @override
  List<PopularMoviesEntity> getPopularMovies() {
    Box<PopularMoviesEntity> box =
        Hive.box<PopularMoviesEntity>(AppConstants.popularMovieKey);
    return box.values.toList();
  }

  // implementation of get trending movies form local storage;
  @override
  List<TrendingMoviesEntity> getTrendingMovies() {
    Box<TrendingMoviesEntity> box =
        Hive.box<TrendingMoviesEntity>(AppConstants.trendingMovieKey);
    return box.values.toList();
  }
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';

import '../../../../core/utils/constant.dart';
import '../../domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';
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
  List<PopularMoviesEntity> getPopularMovies({int pageNumber = 1}) {
    int startIndex = pageNumber * 20;
    int endIndex = (pageNumber + 1) * 20;
    Box<PopularMoviesEntity> box =
        Hive.box<PopularMoviesEntity>(AppConstants.popularMovieKey);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
      // check out of range;
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get trending movies form local storage;
  @override
  List<TrendingMoviesEntity> getTrendingMovies() {
    Box<TrendingMoviesEntity> box =
        Hive.box<TrendingMoviesEntity>(AppConstants.trendingMovieKey);
    return box.values.toList();
  }

  // implementation of get rating movies from local storage;
  @override
  List<TopRatingMoviesEntity> getTopRatingMovies() {
    Box<TopRatingMoviesEntity> box = Hive.box(AppConstants.topRatingMovieKey);
    return box.values.toList();
  }

  // implementation of get up coming movies from local storage;
  @override
  List<UpComingMoviesEntity> getUpComingMovies() {
    Box<UpComingMoviesEntity> box =
        Hive.box<UpComingMoviesEntity>(AppConstants.upComingMoviesKey);
    return box.values.toList();
  }
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/adventure_movies_entity/adventure_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';

import '../../../../core/func/check_out_of_range.dart';
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
    Box<PopularMoviesEntity> box =
        Hive.box<PopularMoviesEntity>(AppConstants.popularMovieKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber  * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get trending movies form local storage;
  @override
  List<TrendingMoviesEntity> getTrendingMovies({int pageNumber = 1}) {
    Box<TrendingMoviesEntity> box =
        Hive.box<TrendingMoviesEntity>(AppConstants.trendingMovieKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber  * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get rating movies from local storage;
  @override
  List<TopRatingMoviesEntity> getTopRatingMovies({int pageNumber = 1}) {
    Box<TopRatingMoviesEntity> box = Hive.box(AppConstants.topRatingMovieKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get up coming movies from local storage;
  @override
  List<UpComingMoviesEntity> getUpComingMovies({int pageNumber = 1}) {
    Box<UpComingMoviesEntity> box =
        Hive.box<UpComingMoviesEntity>(AppConstants.upComingMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber  * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
  
  // implementation of get action movies from local storage;
  @override
  List<ActionMoviesEntity> getActionMovies({int pageNumber = 1}) {
    Box<ActionMoviesEntity> box =
        Hive.box<ActionMoviesEntity>(AppConstants.actionMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber  * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
  
  // implementation of get adventure movies from local storage;
  @override
  List<AdventureMoviesEntity> getAdventureMovies({int pageNumber = 1}) {
    Box<AdventureMoviesEntity> box =
        Hive.box<AdventureMoviesEntity>(AppConstants.adventureMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber  * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}

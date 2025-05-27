import 'package:hive_flutter/hive_flutter.dart';
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
    int endIndex = pageNumber * 20;
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
    int endIndex = pageNumber * 20;
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
    int endIndex = pageNumber * 20;
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
    int endIndex = pageNumber * 20;
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
    int endIndex = pageNumber * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get animations movies from local storage;
  @override
  List<AnimationsMoviesEntity> getAnimationsMovies({int pageNumber = 1}) {
    Box<AnimationsMoviesEntity> box =
        Hive.box<AnimationsMoviesEntity>(AppConstants.animationMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get comedy movies from local storage;
  @override
  List<ComedyMoviesEntity> getComedyMovies({int pageNumber = 1}) {
    Box<ComedyMoviesEntity> box =
        Hive.box<ComedyMoviesEntity>(AppConstants.comedyMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get crime movies from local storage;
  @override
  List<CrimeMoviesEntity> getCrimeMovies({int pageNumber = 1}) {
    Box<CrimeMoviesEntity> box =
        Hive.box<CrimeMoviesEntity>(AppConstants.crimeMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get drama movies from local storage;
  @override
  List<DramaMoviesEntity> getDramaMovies({int pageNumber = 1}) {
    Box<DramaMoviesEntity> box =
        Hive.box<DramaMoviesEntity>(AppConstants.dramaMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get family movies from local storage;
  @override
  List<FamilyMoviesEntity> getFamilyMovies({int pageNumber = 1}) {
    Box<FamilyMoviesEntity> box =
        Hive.box<FamilyMoviesEntity>(AppConstants.familyMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get horror movies from local storage;
  @override
  List<HorrorMoviesEntity> getHorrorMovies({int pageNumber = 1}) {
    Box<HorrorMoviesEntity> box =
        Hive.box<HorrorMoviesEntity>(AppConstants.horrorMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  // implementation of get romance movies from local storage;
  @override
  List<RomanceMoviesEntity> getRomanceMovies({int pageNumber = 1}) {
    Box<RomanceMoviesEntity> box =
        Hive.box<RomanceMoviesEntity>(AppConstants.romanceMoviesKey);
    int startIndex = pageNumber * 0;
    int endIndex = pageNumber * 20;
    bool outOfRange = checkOutOfRange(pageNumber: pageNumber, box: box);
    if (outOfRange) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}

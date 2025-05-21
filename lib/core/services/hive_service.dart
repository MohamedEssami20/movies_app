import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/utils/constant.dart';
import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';

import '../../features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import '../../features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import '../../features/home/domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
      NowPlayingEntityAdapter(),
    );
    Hive.registerAdapter(
      PopularMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      TrendingMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      TopRatingMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      UpComingMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      ActionMoviesEntityAdapter(),
    );
    await _initTypeAdapters();
    await _openAllBoxes();
  }
}

// create method that open all Boxes;
Future<void> _openAllBoxes() async {
  await Hive.openBox<NowPlayingEntity>(AppConstants.nowPlayingKey);
  await Hive.openBox<PopularMoviesEntity>(AppConstants.popularMovieKey);
  await Hive.openBox<TrendingMoviesEntity>(AppConstants.trendingMovieKey);
  await Hive.openBox<TopRatingMoviesEntity>(AppConstants.topRatingMovieKey);
  await Hive.openBox<UpComingMoviesEntity>(AppConstants.upComingMoviesKey);
  await Hive.openBox<ActionMoviesEntity>(AppConstants.actionMoviesKey);
}

List<TypeAdapter> typeAdapters = <TypeAdapter>[
  NowPlayingEntityAdapter(),
  PopularMoviesEntityAdapter(),
  TrendingMoviesEntityAdapter(),
  TopRatingMoviesEntityAdapter(),
  UpComingMoviesEntityAdapter(),
  ActionMoviesEntityAdapter(),
];

// create method that init all type adapters;
Future<void> _initTypeAdapters() async {
  for (final typeAdapter in typeAdapters) {
    if (!Hive.isAdapterRegistered(typeAdapter.typeId)) {
      Hive.registerAdapter(typeAdapter);
    }
  }
}

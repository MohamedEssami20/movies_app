import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/utils/constant.dart';
import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/adventure_movies_entity/adventure_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/animations_movies_entity/animations_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/comedy_movies_entity/comedy_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/crime_movies_entity/crime_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/family_movies_entity/family_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/horror_movies_entity/horror_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/romance_movies_entity/romance_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';

import '../../features/home/domain/entities/drama_movies_entity/drama_movies_entity.dart';
import '../../features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import '../../features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import '../../features/home/domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    registerAllAdapters();
    await _initTypeAdapters();
    await _openAllBoxes();
  }

  static void registerAllAdapters() {
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
    Hive.registerAdapter(
      AdventureMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      CrimeMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      ComedyMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      DramaMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      FamilyMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      AnimationsMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      HorrorMoviesEntityAdapter(),
    );
    Hive.registerAdapter(
      RomanceMoviesEntityAdapter(),
    );
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
  await Hive.openBox<AdventureMoviesEntity>(AppConstants.adventureMoviesKey);
  await Hive.openBox<CrimeMoviesEntity>(AppConstants.crimeMoviesKey);
  await Hive.openBox<ComedyMoviesEntity>(AppConstants.comedyMoviesKey);
  await Hive.openBox<DramaMoviesEntity>(AppConstants.dramaMoviesKey);
  await Hive.openBox<FamilyMoviesEntity>(AppConstants.familyMoviesKey);
  await Hive.openBox<AnimationsMoviesEntity>(AppConstants.animationMoviesKey);
  await Hive.openBox<HorrorMoviesEntity>(AppConstants.horrorMoviesKey);
  await Hive.openBox<RomanceMoviesEntity>(AppConstants.romanceMoviesKey);
}

List<TypeAdapter> typeAdapters = <TypeAdapter>[
  NowPlayingEntityAdapter(),
  PopularMoviesEntityAdapter(),
  TrendingMoviesEntityAdapter(),
  TopRatingMoviesEntityAdapter(),
  UpComingMoviesEntityAdapter(),
  ActionMoviesEntityAdapter(),
  AdventureMoviesEntityAdapter(),
  CrimeMoviesEntityAdapter(),
  ComedyMoviesEntityAdapter(),
  DramaMoviesEntityAdapter(),
  FamilyMoviesEntityAdapter(),
  AnimationsMoviesEntityAdapter(),
  HorrorMoviesEntityAdapter(),
  RomanceMoviesEntityAdapter(),
];

// create method that init all type adapters;
Future<void> _initTypeAdapters() async {
  for (final typeAdapter in typeAdapters) {
    if (!Hive.isAdapterRegistered(typeAdapter.typeId)) {
      Hive.registerAdapter(typeAdapter);
    }
  }
}

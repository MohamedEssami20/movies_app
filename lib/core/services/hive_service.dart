import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/utils/constant.dart';

import '../../features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import '../../features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
      NowPlayingEntityAdapter(),
    );
    Hive.registerAdapter(
      PopularMoviesEntityAdapter(),
    );
    await _initTypeAdapters();
    await _openAllBoxes();
  }
}

// create method that open all Boxes;
Future<void> _openAllBoxes() async {
  await Hive.openBox<NowPlayingEntity>(AppConstants.nowPlayingKey);
  await Hive.openBox<PopularMoviesEntity>(AppConstants.popularMovieKey);
}

List<TypeAdapter> typeAdapters = <TypeAdapter>[
  NowPlayingEntityAdapter(),
  PopularMoviesEntityAdapter(),
];

// create method that init all type adapters;
Future<void> _initTypeAdapters() async {
  for (final typeAdapter in typeAdapters) {
    if (!Hive.isAdapterRegistered(typeAdapter.typeId)) {
      Hive.registerAdapter(typeAdapter);
    }
  }
}

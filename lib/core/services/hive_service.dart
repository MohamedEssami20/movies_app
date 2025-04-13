import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/utils/constant.dart';

import '../../features/home/domain/entities/now_playing_entity.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
      NowPlayingEntityAdapter(),
    );
   await _initTypeAdapters();
   await _openAllBoxes();
  }
}

// create method that open all Boxes;
Future<void>_openAllBoxes()async{
  await Hive.openBox<NowPlayingEntity>(AppConstants.nowPlayingKey);
}

List<TypeAdapter> typeAdapters = <TypeAdapter>[
  NowPlayingEntityAdapter(),
];

// create method that init all type adapters;
Future<void> _initTypeAdapters() async {
  for (final typeAdapter in typeAdapters) {
    if(!Hive.isAdapterRegistered(typeAdapter.typeId)){
      Hive.registerAdapter(typeAdapter);
    }
  }
}


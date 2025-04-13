import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/core/utils/constant.dart';

import '../../features/home/domain/entities/now_playing_entity.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.openBox<NowPlayingEntity>(AppConstants.nowPlayingKey);
  }
}

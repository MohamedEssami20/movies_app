import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';

import '../../../../core/utils/constant.dart';
import 'home_local_data_source.dart';

class HomeLocalDataSouceImpl implements HomeLocalDataSource {
  @override
  List<NowPlayingEntity> getNowPlayingMovies() {
    Box<NowPlayingEntity> box =
        Hive.box<NowPlayingEntity>(AppConstants.nowPlayingKey);
    return box.values.toList();
  }
}

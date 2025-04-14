import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';

abstract class HomeLocalDataSource {
  List<NowPlayingEntity> getNowPlayingMovies();
}

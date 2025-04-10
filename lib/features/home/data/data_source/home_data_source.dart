
import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';

abstract class HomeRemoteDataSource {
  // create method that get now playing movies from api services;
  Future<List<NowPlayingEntity>> getNowPlayingMovies();
}

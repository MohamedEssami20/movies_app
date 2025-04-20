import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';

import '../../domain/entities/popular_movies_entity/popular_movies_entity.dart';

abstract class HomeLocalDataSource {
  //create method to get now playing movies from local storage;
  List<NowPlayingEntity> getNowPlayingMovies();
  //create method that get trending movies from local storage;
  List<PopularMoviesEntity> getTrendingMovies();
}

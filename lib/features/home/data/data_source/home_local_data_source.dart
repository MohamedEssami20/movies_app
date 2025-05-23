import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';

import '../../domain/entities/action_movies_entity/action_movies_entity.dart';
import '../../domain/entities/adventure_movies_entity/adventure_movies_entity.dart';
import '../../domain/entities/popular_movies_entity/popular_movies_entity.dart';
import '../../domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';
import '../../domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';

abstract class HomeLocalDataSource {
  //create method to get now playing movies from local storage;
  List<NowPlayingEntity> getNowPlayingMovies();

  //create method that get popular movies from local storage;
  List<PopularMoviesEntity> getPopularMovies({int pageNumber = 1});

  // create method that get trending movies from local storage;
  List<TrendingMoviesEntity> getTrendingMovies({int pageNumber = 1});

  // create method that get top rating movies from local storage;
  List<TopRatingMoviesEntity> getTopRatingMovies({int pageNumber = 1});

  // create method that get upcoming movies from local storage;
  List<UpComingMoviesEntity> getUpComingMovies({int pageNumber = 1});

  // create method that get action movies from local storage;
  List<ActionMoviesEntity> getActionMovies({int pageNumber = 1});

  // create method that get adventure movies from local storage;
  List<AdventureMoviesEntity> getAdventureMovies({int pageNumber = 1});
}

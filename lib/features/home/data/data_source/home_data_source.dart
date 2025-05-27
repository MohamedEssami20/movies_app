import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/adventure_movies_entity/adventure_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/crime_movies_entity/crime_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';

import '../../domain/entities/animations_movies_entity/animations_movies_entity.dart';
import '../../domain/entities/comedy_movies_entity/comedy_movies_entity.dart';
import '../../domain/entities/drama_movies_entity/drama_movies_entity.dart';
import '../../domain/entities/family_movies_entity/family_movies_entity.dart';
import '../../domain/entities/horror_movies_entity/horror_movies_entity.dart';
import '../../domain/entities/romance_movies_entity/romance_movies_entity.dart';
import '../../domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';

abstract class HomeRemoteDataSource {
  // create method that get now playing movies from api services;
  Future<List<NowPlayingEntity>> getNowPlayingMovies();

  // create method that get popular movies from api services;
  Future<List<PopularMoviesEntity>> getPopularMovies({int pageNumber = 1});

  //create method that get trending movies frome api services;
  Future<List<TrendingMoviesEntity>> getTrendingMovies({int pageNumber = 1});

  // create method that get top rating movies from api;
  Future<List<TopRatingMoviesEntity>> getTopRatedMovies({int pageNumber = 1});

  // create method that get upcoming movies from api;
  Future<List<UpComingMoviesEntity>> getUpcomingMovies({int pageNumber = 1});

  //create method that get action movies from api;
  Future<List<ActionMoviesEntity>> getActionMovies({int pageNumber = 1});

  // create method that get adventure movies from api;
  Future<List<AdventureMoviesEntity>> getAdventureMovies({int pageNumber = 1});

  // creat method that get comedy movies from api;
  Future<List<ComedyMoviesEntity>> getComedyMovies({int pageNumber = 1});

  // create method that get crime movies from api;
  Future<List<CrimeMoviesEntity>> getCrimeMovies({int pageNumber = 1});

  // create method that get animation movies from api;
  Future<List<AnimationsMoviesEntity>> getAnimationsMovies(
      {int pageNumber = 1});

  // create method that get drama movies from api;
  Future<List<DramaMoviesEntity>> getDramaMovies({int pageNumber = 1});

  //create method that get family movies from api;
  Future<List<FamilyMoviesEntity>> getFamilyMovies({int pageNumber = 1});

  // create method that get horror movies from api;
  Future<List<HorrorMoviesEntity>> getHorrorMovies({int pageNumber = 1});

  // creat method that get romance movies from api;
  Future<List<RomanceMoviesEntity>> getRomanceMovies({int pageNumber = 1});
}

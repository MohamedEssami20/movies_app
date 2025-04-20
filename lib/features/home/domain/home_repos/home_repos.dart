// create abstract class home_repos
import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/now_palying_entity/now_playing_entity.dart';

abstract class HomeRepos {
  // create method that get now playing movies;
  Future<Either<Failure, List<NowPlayingEntity>>> getNowPlayingMovies();
  // creat method that get Trending movies;
  Future<Either<Failure, List<PopularMoviesEntity>>> getTrendingMovies();
}

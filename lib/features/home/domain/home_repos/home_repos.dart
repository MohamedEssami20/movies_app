// create abstract class home_repos
import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/now_palying_entity/now_playing_entity.dart';
import '../entities/trending_movies_entity.dart/trending_movies_entity.dart';
import '../entities/up_coming_movies_entity/up_coming_movies_entity.dart';

abstract class HomeRepos {
  // create method that get now playing movies;
  Future<Either<Failure, List<NowPlayingEntity>>> getNowPlayingMovies();

  // creat method that get popular movies;
  Future<Either<Failure, List<PopularMoviesEntity>>> getPopularMovies();

  // create method that get trending movies;
  Future<Either<Failure, List<TrendingMoviesEntity>>> getTrendingMovies();

  //create method that get top rating movies;
  Future<Either<Failure, List<TopRatingMoviesEntity>>> getTopRatingMovies();

  // create method that get up coming movies;
  Future<Either<Failure, List<UpComingMoviesEntity>>> getUpComingMovies();
}

// create abstract class home_repos
import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/action_movies_entity/action_movies_entity.dart';
import '../entities/adventure_movies_entity/adventure_movies_entity.dart';
import '../entities/animations_movies_entity/animations_movies_entity.dart';
import '../entities/comedy_movies_entity/comedy_movies_entity.dart';
import '../entities/crime_movies_entity/crime_movies_entity.dart';
import '../entities/drama_movies_entity/drama_movies_entity.dart';
import '../entities/family_movies_entity/family_movies_entity.dart';
import '../entities/horror_movies_entity/horror_movies_entity.dart';
import '../entities/now_palying_entity/now_playing_entity.dart';
import '../entities/romance_movies_entity/romance_movies_entity.dart';
import '../entities/trending_movies_entity.dart/trending_movies_entity.dart';
import '../entities/up_coming_movies_entity/up_coming_movies_entity.dart';

abstract class HomeRepos {
  // create method that get now playing movies;
  Future<Either<Failure, List<NowPlayingEntity>>> getNowPlayingMovies();

  // creat method that get popular movies;
  Future<Either<Failure, List<PopularMoviesEntity>>> getPopularMovies(
      {int pageNumber = 1});

  // create method that get trending movies;
  Future<Either<Failure, List<TrendingMoviesEntity>>> getTrendingMovies(
      {int pageNumber = 1});

  //create method that get top rating movies;
  Future<Either<Failure, List<TopRatingMoviesEntity>>> getTopRatingMovies(
      {int pageNumber = 1});

  // create method that get up coming movies;
  Future<Either<Failure, List<UpComingMoviesEntity>>> getUpComingMovies(
      {int pageNumber = 1});

  // create method that get action movries;
  Future<Either<Failure, List<ActionMoviesEntity>>> getActionMovies(
      {int pageNumber = 1});

  // create method that get adventure movies;
  Future<Either<Failure, List<AdventureMoviesEntity>>> getAdventureMovies(
      {int pageNumber = 1});

  // create method that get comedy movies;
  Future<Either<Failure, List<ComedyMoviesEntity>>> getComedyMovies(
      {int pageNumber = 1});

  // create method that get crime movies;
  Future<Either<Failure, List<CrimeMoviesEntity>>> getCrimeMovies(
      {int pageNumber = 1});

  // create method that get animation movies;
  Future<Either<Failure, List<AnimationsMoviesEntity>>> getAnimationsMovies(
      {int pageNumber = 1});

  // create method that get drama movies;
  Future<Either<Failure, List<DramaMoviesEntity>>> getDramaMovies(
      {int pageNumber = 1});

  // create method that get family movies;
  Future<Either<Failure, List<FamilyMoviesEntity>>> getFamilyMovies(
      {int pageNumber = 1});

  // create method that get horror movies;
  Future<Either<Failure, List<HorrorMoviesEntity>>> getHorrorMovies(
      {int pageNumber = 1});

  // create method that get romance movies;
  Future<Either<Failure, List<RomanceMoviesEntity>>> getRomanceMovies(
      {int pageNumber = 1});
}

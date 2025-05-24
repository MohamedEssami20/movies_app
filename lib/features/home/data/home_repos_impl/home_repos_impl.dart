import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/adventure_movies_entity/adventure_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/animations_movies_entity/animations_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/comedy_movies_entity/comedy_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/crime_movies_entity/crime_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/drama_movies_entity/drama_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/family_movies_entity/family_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/horror_movies_entity/horror_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/romance_movies_entity/romance_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/top_rating_movies_entity/top_rating_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/trending_movies_entity.dart/trending_movies_entity.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';
import '../../../../core/func/get_movies_data_impl.dart';
import '../../domain/entities/up_coming_movies_entity/up_coming_movies_entity.dart';

class HomeReposImpl implements HomeRepos {
  HomeRemoteDataSource homeDataSourceRepos;
  HomeLocalDataSource homeLocalDataSource;
  HomeReposImpl({
    required this.homeDataSourceRepos,
    required this.homeLocalDataSource,
  });

  // implementation of get Now Playing movies;
  @override
  Future<Either<Failure, List<NowPlayingEntity>>> getNowPlayingMovies() async {
    Future<List<NowPlayingEntity>> homeRemoteSource =
        homeDataSourceRepos.getNowPlayingMovies();
    List<NowPlayingEntity> homeLocalSource =
        homeLocalDataSource.getNowPlayingMovies();
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }

  // implementation of get popular movies;
  @override
  Future<Either<Failure, List<PopularMoviesEntity>>> getPopularMovies(
      {int pageNumber = 1}) {
    Future<List<PopularMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getPopularMovies(pageNumber: pageNumber);
    List<PopularMoviesEntity> homeLocalSource =
        homeLocalDataSource.getPopularMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }

  // iplmentation of get trending movies;
  @override
  Future<Either<Failure, List<TrendingMoviesEntity>>> getTrendingMovies(
      {int pageNumber = 1}) {
    Future<List<TrendingMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getTrendingMovies(pageNumber: pageNumber);
    List<TrendingMoviesEntity> homeLocalSource =
        homeLocalDataSource.getTrendingMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }

  // implementation get top rating movies form repos;
  @override
  Future<Either<Failure, List<TopRatingMoviesEntity>>> getTopRatingMovies(
      {int pageNumber = 1}) {
    Future<List<TopRatingMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getTopRatedMovies(pageNumber: pageNumber);
    List<TopRatingMoviesEntity> homeLocalSource =
        homeLocalDataSource.getTopRatingMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }

  // implementation get upcoming movies from repos;
  @override
  Future<Either<Failure, List<UpComingMoviesEntity>>> getUpComingMovies(
      {int pageNumber = 1}) {
    Future<List<UpComingMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getUpcomingMovies(pageNumber: pageNumber);
    List<UpComingMoviesEntity> homeLocalSource =
        homeLocalDataSource.getUpComingMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }

  // implementation get action movies from repos;
  @override
  Future<Either<Failure, List<ActionMoviesEntity>>> getActionMovies(
      {int pageNumber = 1}) {
    Future<List<ActionMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getActionMovies(pageNumber: pageNumber);
    List<ActionMoviesEntity> homeLocalSource =
        homeLocalDataSource.getActionMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
  
  // implementation get adventure movies from repos;
  @override
  Future<Either<Failure, List<AdventureMoviesEntity>>> getAdventureMovies({int pageNumber = 1}) {
    Future<List<AdventureMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getAdventureMovies(pageNumber: pageNumber);
    List<AdventureMoviesEntity> homeLocalSource =
        homeLocalDataSource.getAdventureMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
  
  // implementation get animations movies from repos;
  @override
  Future<Either<Failure, List<AnimationsMoviesEntity>>> getAnimationsMovies({int pageNumber = 1}) {
    Future<List<AnimationsMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getAnimationsMovies(pageNumber: pageNumber);
    List<AnimationsMoviesEntity> homeLocalSource =
        homeLocalDataSource.getAnimationsMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
  
  // implementation get comedy movies from repos;
  @override
  Future<Either<Failure, List<ComedyMoviesEntity>>> getComedyMovies({int pageNumber = 1}) {
    Future<List<ComedyMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getComedyMovies(pageNumber: pageNumber);
    List<ComedyMoviesEntity> homeLocalSource =
        homeLocalDataSource.getComedyMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
  
  // implementation get crime movies from repos;
  @override
  Future<Either<Failure, List<CrimeMoviesEntity>>> getCrimeMovies({int pageNumber = 1}) {
    Future<List<CrimeMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getCrimeMovies(pageNumber: pageNumber);
    List<CrimeMoviesEntity> homeLocalSource =
        homeLocalDataSource.getCrimeMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
  
  // implementation get drama movies from repos;
  @override
  Future<Either<Failure, List<DramaMoviesEntity>>> getDramaMovies({int pageNumber = 1}) {
    Future<List<DramaMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getDramaMovies(pageNumber: pageNumber);
    List<DramaMoviesEntity> homeLocalSource =
        homeLocalDataSource.getDramaMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
  
  // implementation get family movies from repos;
  @override
  Future<Either<Failure, List<FamilyMoviesEntity>>> getFamilyMovies({int pageNumber = 1}) {
    Future<List<FamilyMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getFamilyMovies(pageNumber: pageNumber);
    List<FamilyMoviesEntity> homeLocalSource =
        homeLocalDataSource.getFamilyMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
  
  // implementation get horror movies from repos;
  @override
  Future<Either<Failure, List<HorrorMoviesEntity>>> getHorrorMovies({int pageNumber = 1}) {
    Future<List<HorrorMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getHorrorMovies(pageNumber: pageNumber);
    List<HorrorMoviesEntity> homeLocalSource =
        homeLocalDataSource.getHorrorMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
  
  // implementation get romance movies from repos;
  @override
  Future<Either<Failure, List<RomanceMoviesEntity>>> getRomanceMovies({int pageNumber = 1}) {
    Future<List<RomanceMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getRomanceMovies(pageNumber: pageNumber);
    List<RomanceMoviesEntity> homeLocalSource =
        homeLocalDataSource.getRomanceMovies(pageNumber: pageNumber);
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:movies_app/features/home/domain/entities/action_movies_entity/action_movies_entity.dart';
import 'package:movies_app/features/home/domain/entities/now_palying_entity/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity/popular_movies_entity.dart';
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
}

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/data/data_source/home_local_data_source.dart';
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
  Future<Either<Failure, List<PopularMoviesEntity>>> getPopularMovies() {
    Future<List<PopularMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getPopularMovies();
    List<PopularMoviesEntity> homeLocalSource =
        homeLocalDataSource.getPopularMovies();
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }

  // iplmentation of get trending movies;
  @override
  Future<Either<Failure, List<TrendingMoviesEntity>>> getTrendingMovies() {
    Future<List<TrendingMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getTrendingMovies();
    List<TrendingMoviesEntity> homeLocalSource =
        homeLocalDataSource.getTrendingMovies();
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }

  // implementation get top rating movies form repos;
  @override
  Future<Either<Failure, List<TopRatingMoviesEntity>>> getTopRatingMovies() {
    Future<List<TopRatingMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getTopRatedMovies();
    List<TopRatingMoviesEntity> homeLocalSource =
        homeLocalDataSource.getTopRatingMovies();
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }

  // implementation get upcoming movies from repos;
  @override
  Future<Either<Failure, List<UpComingMoviesEntity>>> getUpComingMovies() {
    Future<List<UpComingMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getUpcomingMovies();
    List<UpComingMoviesEntity> homeLocalSource =
        homeLocalDataSource.getUpComingMovies();
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
}

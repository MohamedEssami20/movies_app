import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/entities/popular_movies_entity.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';
import '../../../../core/func/get_movies_data_impl.dart';

class HomeReposImpl implements HomeRepos {
  HomeRemoteDataSource homeDataSourceRepos;
  HomeLocalDataSource homeLocalDataSource;
  HomeReposImpl({
    required this.homeDataSourceRepos,
    required this.homeLocalDataSource,
  });
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

  @override
  Future<Either<Failure, List<PopularMoviesEntity>>> getTrendingMovies() {
    Future<List<PopularMoviesEntity>> homeRemoteSource =
        homeDataSourceRepos.getTrendingMovies();
    List<PopularMoviesEntity> homeLocalSource =
        homeLocalDataSource.getTrendingMovies();
    return getMoviesDataImpl(
      homeRemoteDataSource: homeRemoteSource,
      homeLocalDataSource: homeLocalSource,
    );
  }
}

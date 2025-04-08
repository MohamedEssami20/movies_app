import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';

class HomeReposImpl implements HomeRepos {
  HomeRemoteDataSource homeDataSourceRepos;
  HomeReposImpl({required this.homeDataSourceRepos});
  @override
  Future<Either<Failure, NowPlayingEntity>> getNowPlayingMovies() async {
    return await homeDataSourceRepos.getNowPlayingMovies();
  }
}

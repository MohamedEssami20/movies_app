import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source_repos.dart';
import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';

class HomeDataSourceImpl implements HomeDataSourceRepos{
  @override
  Future<Either<Failure, NowPlayingEntity>> getNowPlayingMovies() {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }
}
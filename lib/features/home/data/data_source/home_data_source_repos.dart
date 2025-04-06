import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/domain/entities/now_playing_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeDataSourceRepos {

  // create method that get now playing movies from api services;
  Future<Either<Failure,NowPlayingEntity>> getNowPlayingMovies(); 
}
// create abstract class home_repos
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/now_playing_entity.dart';

abstract class HomeRepos {
  // create method that get now playing movies;
  Future<Either<Failure,List<NowPlayingEntity>>> getNowPlayingMovies();
}

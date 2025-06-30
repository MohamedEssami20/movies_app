import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../watch_list_entity/watch_list_entity.dart';

abstract class WatchListRepos {
  // creat method that add movie to watch list;
  Future<void> addMovieToWatchList(
      {
      required int docsId,
      required Map<String, dynamic> data});
  // creat method that get watch list movies;
  Future<Either<Failure, List<WatchListEntity>>> getWatchListMovies();
}

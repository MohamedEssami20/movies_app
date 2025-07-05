import '../../domain/watch_list_entity/watch_list_entity.dart';

abstract class WatchListRemoteDataSource {
  // create method that add movie to watch list to FireStore;
  Future<void> addMovieToWatchList(
      {required int docsId, required Map<String, dynamic> data});

  // create method that get watch list movies from FireStore;
  Future<List<WatchListEntity>> getWatchListMovies();
}

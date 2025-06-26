abstract class WatchListRemoteDataSource {
  // create method that add movie to watch list to FireStore;
  Future<void> addMovieToWatchList(
      { required int docsId, required Map<String, dynamic> data});
}

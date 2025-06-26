abstract class WatchListRepos {
  // creat method that add movie to watch list;
  Future<void> addMovieToWatchList(
      {
      required int docsId,
      required Map<String, dynamic> data});
}

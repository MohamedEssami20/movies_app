class MovieTrailerEntity {
  final String movieId;
  final String movieName;
  final String movieKey;
  final String movieSite;
  final String siteType;
  final DateTime moviePublishedAt;

  MovieTrailerEntity(
      {required this.movieId,
      required this.movieName,
      required this.movieKey,
      required this.movieSite,
      required this.siteType,
      required this.moviePublishedAt});
}

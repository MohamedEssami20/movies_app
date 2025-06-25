class WatchListEntity {
  final int movieId;
  final String movietitle;
  final String movieImage;
  final String movieRelaseDate;
  final double movieVoteAverage;
  final int movieDuration;
  final List<String> movieGenres;

  WatchListEntity({
    required this.movieId,
    required this.movietitle,
    required this.movieImage,
    required this.movieRelaseDate,
    required this.movieVoteAverage,
    required this.movieDuration,
    required this.movieGenres,
  });
}
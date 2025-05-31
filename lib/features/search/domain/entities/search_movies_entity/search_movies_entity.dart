class SearchMoviesEntity {
  final int movieId;
  final String movieTitle;
  final double movieRating;
  final String movieRealseDate;
  final String moviePoster;

  SearchMoviesEntity(
      {required this.movieId,
      required this.movieTitle,
      required this.movieRating,
      required this.movieRealseDate,
      required this.moviePoster});
}

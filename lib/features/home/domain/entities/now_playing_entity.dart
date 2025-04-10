class NowPlayingEntity {
  final int moviesId;
  final String movieTitle;
  final double voteAveragemovie;
  final String movieImage;

  NowPlayingEntity({
    required this.moviesId,
    required this.movieTitle,
    required this.voteAveragemovie,
    required this.movieImage,
  });

  factory NowPlayingEntity.fromJson(Map<String, dynamic> json) {
    return NowPlayingEntity(
      moviesId: json['id'],
      movieTitle: json['title'],
      voteAveragemovie: json['vote_average'].toDouble(),
      movieImage: json['poster_path'],
    );
  }
}

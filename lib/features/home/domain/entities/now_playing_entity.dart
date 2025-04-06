class NowPlayingEntity {
  final int moviesId;
  final String movieTitle;
  final double voteAveragemovie;

  NowPlayingEntity({
    required this.moviesId,
    required this.movieTitle,
    required this.voteAveragemovie,
  });

  factory NowPlayingEntity.fromJson(Map<String, dynamic> json) {
    return NowPlayingEntity(
      moviesId: json['id'],
      movieTitle: json['title'],
      voteAveragemovie: json['vote_average'].toDouble(),
    );
  }
}

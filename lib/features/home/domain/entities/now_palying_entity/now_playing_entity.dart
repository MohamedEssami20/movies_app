import 'package:hive_flutter/hive_flutter.dart';

import '../base_movies_entity.dart';
part 'now_playing_entity.g.dart';

@HiveType(typeId: 0)
class NowPlayingEntity extends HiveObject implements BaseMoviesEntity {
  @HiveField(0)
  final int moviesId;
  @HiveField(1)
  final String movieTitle;
  @HiveField(2)
  final double voteAveragemovie;
  @HiveField(3)
  final String movieImage;

  NowPlayingEntity({
    required this.moviesId,
    required this.movieTitle,
    required this.voteAveragemovie,
    required this.movieImage,
  }) : super();

  @override
  int get baseMoviesId => moviesId;

  factory NowPlayingEntity.fromJson(Map<String, dynamic> json) {
    return NowPlayingEntity(
      moviesId: json['id'],
      movieTitle: json['title'],
      voteAveragemovie: json['vote_average'].toDouble(),
      movieImage: json['poster_path'],
    );
  }
}

import 'package:hive_flutter/hive_flutter.dart';

import '../base_movies_entity.dart';
part 'animations_movies_entity.g.dart';

@HiveField(9)
class AnimationsMoviesEntity extends HiveObject implements BaseMoviesEntity {
  @HiveField(0)
  final int movieId;
  @HiveField(1)
  final String movieTitle;
  @HiveField(2)
  final String moviePoster;

  AnimationsMoviesEntity(
      {required this.movieId,
      required this.movieTitle,
      required this.moviePoster});

  @override
  int get baseMoviesId => movieId;
}

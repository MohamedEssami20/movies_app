import 'package:hive_flutter/hive_flutter.dart';

import '../base_movies_entity.dart';
part 'drama_movies_entity.g.dart';

@HiveField(10)
class DramaMoviesEntity extends HiveObject implements BaseMoviesEntity {
  @HiveField(0)
  final int movieId;
  @HiveField(1)
  final String movieTitle;
  @HiveField(2)
  final String moviePoster;

  DramaMoviesEntity(
      {required this.movieId,
      required this.movieTitle,
      required this.moviePoster});

  @override
  int get baseMoviesId => movieId;
}

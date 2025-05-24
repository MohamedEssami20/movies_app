import 'package:hive_flutter/hive_flutter.dart';

import '../base_movies_entity.dart';
part 'crime_movies_entity.g.dart';

@HiveField(8)
class CrimeMoviesEntity extends HiveObject implements BaseMoviesEntity {
  @HiveType(typeId: 0)
  final int movieId;
  @HiveType(typeId: 1)
  final String movieTitle;
  @HiveType(typeId: 2)
  final String moviePoster;

  CrimeMoviesEntity(
      {required this.movieId,
      required this.movieTitle,
      required this.moviePoster});

  @override
  int get baseMoviesId => movieId;
}

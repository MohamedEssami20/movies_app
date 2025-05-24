import 'package:hive_flutter/hive_flutter.dart';

import '../base_movies_entity.dart';
part 'family_movies_entity.g.dart';

@HiveField(11)
class FamilyMoviesEntity extends HiveObject implements BaseMoviesEntity {
  @HiveType(typeId: 0)
  final int movieId;
  @HiveType(typeId: 1)
  final String movieTitle;
  @HiveType(typeId: 2)
  final String moviePoster;

  FamilyMoviesEntity(
      {required this.movieId,
      required this.movieTitle,
      required this.moviePoster});

  @override
  int get baseMoviesId => movieId;
}

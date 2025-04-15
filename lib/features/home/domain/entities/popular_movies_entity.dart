import 'package:hive_flutter/hive_flutter.dart';

import 'base_movies_entity.dart';
part 'popular_movies_entity.g.dart';

@HiveType(typeId: 1)
class PopularMoviesEntity extends HiveObject implements BaseMoviesEntity {
  @HiveField(0)
  final int movieId;
  @HiveField(1)
  final String movieTitle;
  @HiveField(2)
  final String moviePoster;

  PopularMoviesEntity({
    required this.movieId,
    required this.movieTitle,
    required this.moviePoster,
  }) : super();

  @override
  int get baseMoviesId => movieId;
}

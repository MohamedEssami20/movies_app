
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/features/home/domain/entities/base_movies_entity.dart';

part 'action_movies_entity.g.dart';

@HiveField(5)
class ActionMoviesEntity extends HiveObject implements BaseMoviesEntity {
  @HiveType(typeId: 0)
  final int movieId;
  @HiveType(typeId: 1)
  final String movieTitle;
  @HiveType(typeId: 2)
  final String moviePoster;

  ActionMoviesEntity(
      {required this.movieId,
      required this.movieTitle,
      required this.moviePoster});

@override
  int get baseMoviesId => movieId;

}

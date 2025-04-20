import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/features/home/domain/entities/base_movies_entity.dart';
part 'trending_movies_entity.g.dart';

@HiveType(typeId: 2)
class TrendingMoviesEntity extends HiveObject implements BaseMoviesEntity {
  @HiveField(0)
  final int movieId;
  @HiveField(1)
  final String movieTitle;
  @HiveField(2)
  final String moviePoster;

  TrendingMoviesEntity({
    required this.movieId,
    required this.movieTitle,
    required this.moviePoster,
  }) : super();

  @override
  int get baseMoviesId => movieId;
}

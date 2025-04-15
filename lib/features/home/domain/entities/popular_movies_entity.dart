
import 'package:hive_flutter/hive_flutter.dart';
part 'popular_movies_entity.g.dart';
@HiveType(typeId: 1)
class PopularMoviesEntity extends HiveObject {
  @HiveField(0)
  final int moiveId;
  @HiveField(1)
  final String movieTitle;
  @HiveField(2)
  final String moviePoster;

  PopularMoviesEntity({
    required this.moiveId,
    required this.movieTitle,
    required this.moviePoster,
  });
}

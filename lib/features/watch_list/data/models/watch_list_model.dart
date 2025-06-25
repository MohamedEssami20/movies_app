import 'package:movies_app/features/details_movies/domain/movies_details_entity/movies_details_entity.dart';
import 'package:movies_app/features/watch_list/domain/watch_list_entity/watch_list_entity.dart';

class WatchListModel extends WatchListEntity {
  final int? id;
  final String? title;
  final String? posterPath;
  final String? relaseDate;
  final double? voteAverage;
  final int? runtime;
  final List<String>? genres;

  WatchListModel(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.relaseDate,
      required this.voteAverage,
      required this.runtime,
      required this.genres})
      : super(
          movieId: id ?? 0,
          movietitle: title ?? '',
          movieImage: posterPath ?? '',
          movieRelaseDate: relaseDate ?? '',
          movieVoteAverage: voteAverage ?? 0.0,
          movieDuration: 0,
          movieGenres: genres ?? [],
        );

  factory WatchListModel.fromJson(Map<String, dynamic> json) {
    return WatchListModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      relaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      runtime: json['runtime'],
      genres: List<String>.from(json['genres'].map((e) => e['name'])),
    );
  }

  factory WatchListModel.fromFirebase(MoviesDetailsEntity moviesDetailsEntity) {
    return WatchListModel(
      id: moviesDetailsEntity.movieId,
      title: moviesDetailsEntity.movieTitle,
      posterPath: moviesDetailsEntity.movieImage,
      relaseDate: moviesDetailsEntity.movieDateRelease,
      voteAverage: moviesDetailsEntity.movieRating,
      runtime: moviesDetailsEntity.movieDuration,
      genres: moviesDetailsEntity.movieGenres,
    );
  }
}

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

  factory WatchListModel.formFireStore(Map<String, dynamic> json) {
    return WatchListModel(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      relaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      runtime: json['runtime'],
      genres: json['genres'] != null ? List<String>.from(json['genres']) : [],
    );
  }
}

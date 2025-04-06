class TrendingMoviesModel {
  String? backdropPath;
  int? id;
  String? name;
  String? originalName;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  String? firstAirDate;
  double? voteAverage;
  int? voteCount;
  List<String>? originCountry;

  TrendingMoviesModel({
    this.backdropPath,
    this.id,
    this.name,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  });

  factory TrendingMoviesModel.fromJson(Map<String, dynamic> json) {
    return TrendingMoviesModel(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      mediaType: json['media_type'] as String?,
      adult: json['adult'] as bool?,
      originalLanguage: json['original_language'] as String?,
      genreIds: json['genre_ids'] as List<int>?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      firstAirDate: json['first_air_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
      originCountry: json['origin_country'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath,
        'id': id,
        'name': name,
        'original_name': originalName,
        'overview': overview,
        'poster_path': posterPath,
        'media_type': mediaType,
        'adult': adult,
        'original_language': originalLanguage,
        'genre_ids': genreIds,
        'popularity': popularity,
        'first_air_date': firstAirDate,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'origin_country': originCountry,
      };
}

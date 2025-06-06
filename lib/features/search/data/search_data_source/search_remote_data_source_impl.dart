
import 'package:movies_app/core/services/api_services.dart';
import 'package:movies_app/features/search/domain/entities/search_movies_entity/search_movies_entity.dart';

import '../../../../core/utils/api_end_points.dart';
import '../models/search_movies_model.dart';
import 'search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiServices apiServices;

  SearchRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<SearchMoviesEntity>> searchMovies({required String query}) async {
    List<SearchMoviesEntity> searchMovies = [];
    final results =
        await ApiServices().get("${ApiEndPoints.searchMovies}&query=$query");
    for (var movies in results['results']) {
      searchMovies.add(SearchMoviesModel.fromJson(movies));
    }
    return searchMovies;
  }
}

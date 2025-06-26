// create get it service ;
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/services/firebase_auth_service.dart';
import 'package:movies_app/features/auth/data/auth_repos_impl/auth_repos_impl.dart';
import 'package:movies_app/features/details_movies/data/movies_details_data_source/movies_details_remote_data_src.dart';
import 'package:movies_app/features/details_movies/data/repos_impl/movies_details_repo_impl.dart';
import 'package:movies_app/features/details_movies/domain/repos/details_movies_repos.dart';
import 'package:movies_app/features/home/data/data_source/home_data_source.dart';
import 'package:movies_app/features/home/data/data_source/home_local_data_souce_impl.dart';
import 'package:movies_app/features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:movies_app/features/home/data/home_repos_impl/home_repos_impl.dart';
import 'package:movies_app/features/home/domain/home_repos/home_repos.dart';
import 'package:movies_app/features/search/data/search_data_source/search_remote_data_source.dart';
import 'package:movies_app/features/search/data/search_data_source/search_remote_data_source_impl.dart';
import 'package:movies_app/features/search/data/search_repos_impl/search_repos_impl.dart';
import 'package:movies_app/features/search/domain/search_repos/search_repos.dart';
import 'package:movies_app/features/watch_list/data/watch_list_repo_impl/watch_list_repo_impl.dart';

import '../../features/auth/domain/repos/auth_repos.dart';
import '../../features/details_movies/data/movies_details_data_source_impl.dart/movies_details_remote_data_src_impl.dart';
import '../../features/home/data/data_source/home_local_data_source.dart';
import '../../features/watch_list/data/watch_list_remote_data_source/watch_list_remote_data_source.dart';
import '../../features/watch_list/data/watch_list_remote_data_source/watch_list_remote_data_source_impl.dart';
import '../../features/watch_list/domain/watch_list_repos/watch_list_repos.dart';
import 'api_services.dart';
import 'database_service.dart';
import 'firebase_firestore_service.dart';

final GetIt getIt = GetIt.instance;

// create method that setup getit;
void setupGetIt() {
  getIt.registerSingleton<DatabaseService>(FirebaseFirestoreService());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepos>(
    AuthReposImpl(
      dataBaseService: getIt.get<DatabaseService>(),
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
    ),
  );
  getIt.registerSingleton<ApiServices>(ApiServices());
  getIt.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
  getIt.registerSingleton<HomeLocalDataSource>(HomeLocalDataSouceImpl());
  getIt.registerSingleton<HomeRepos>(
    HomeReposImpl(
      homeDataSourceRepos: getIt.get<HomeRemoteDataSource>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSource>(),
    ),
  );

  getIt.registerSingleton<SearchRemoteDataSource>(
    SearchRemoteDataSourceImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );

  getIt.registerSingleton<SearchRepos>(
    SearchReposImpl(
      searchRemoteDataSource: getIt.get<SearchRemoteDataSource>(),
    ),
  );

  getIt.registerSingleton<MoviesDetailsRemoteDataSource>(
    MoviesDetailsRemoteDataSrcImpl(
      apiServices: getIt.get<ApiServices>(),
    ),
  );

  getIt.registerSingleton<DetailsMoviesRepos>(
    MoviesDetailsRepoImpl(
      moviesDetailsRemoteDataSource: getIt.get<MoviesDetailsRemoteDataSource>(),
    ),
  );

  getIt.registerSingleton<FirebaseFirestoreService>(
    FirebaseFirestoreService(),
  );

  getIt.registerSingleton<WatchListRemoteDataSource>(
    WatchListRemoteDataSourceImpl(
      firebaseFirestoreService: getIt.get<FirebaseFirestoreService>(),
    ),
  );

  getIt.registerSingleton<WatchListRepos>(
    WatchListRepoImpl(
      watchListRemoteDataSource: getIt.get<WatchListRemoteDataSource>(),
    ),
  );
}

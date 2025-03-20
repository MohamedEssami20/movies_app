// create get it service ;
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/services/firebase_auth_service.dart';
import 'package:movies_app/features/auth/data/auth_repos_impl/auth_repos_impl.dart';

import '../../features/auth/domain/repos/auth_repos.dart';
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
}

// create method that add user data
import 'package:movies_app/core/services/database_service.dart';
import 'package:movies_app/core/utils/backend_endpoint.dart';

import '../errors/failure.dart';

Future<void> addUserData(
    {required DatabaseService databaseService,
    required Map<String,dynamic> data,
    String? documentId}) async {
  try {
    await databaseService.addData(
      path: BackendEndpoint.userPath,
      data: data,
      documentId: documentId!,
    );
  } catch (error) {
    Failure("failed to add user data ");
  }
}

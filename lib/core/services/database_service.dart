abstract class DatabaseService {
  // create method that add data to database;
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      required String documentId});
}

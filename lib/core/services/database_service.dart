abstract class DatabaseService {
  // create method that add data to database;
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      required String documentId});

  // create method that get data from database;
  Future<List<Map<String, dynamic>>> getData({required String path});
}

import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

Future<void> saveMoviesLocal<T>(
    {required String boxName, required List<T> results}) async {
  Box<T> box = Hive.box<T>(boxName);
  if (box.isEmpty) {
    await box.addAll(results);
    log("movies saved in local1 and movies length= ${box.length}");
  } else {
    await box.clear();
    await box.addAll(results);
    log("movies saved in local2 and movies length= ${box.length}");
  }
}

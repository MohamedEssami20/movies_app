import 'package:hive_flutter/hive_flutter.dart';

bool checkOutOfRange<T>({required int pageNumber, required Box<T> box}) {
  {
    int startIndex = pageNumber * 20;
    int endIndex = (pageNumber + 1) * 20;
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return true;
      // check out of range;
    }
    return false;
  }
}

import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

bool checkOutOfRange<T>({required int pageNumber, required Box<T> box}) {
  {
    int startIndex = pageNumber * 20;
    int length = box.values.length;
    log("length of box in out of range= $length");
    if (startIndex > length || box.values.isEmpty) {
      return true;
      // check out of range;
    }
    return false;
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'categories_items_state.dart';

class CategoriesItemsCubit extends Cubit<int> {
  CategoriesItemsCubit() : super(0);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(index);
  }
}

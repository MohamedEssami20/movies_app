import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<int> {
  BottomBarCubit() : super(0);

  void changeIndex(int index) {
    emit(index);
  }
}

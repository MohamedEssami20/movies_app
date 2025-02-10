import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);

  // create method that emit current page in page view;
  void changePage(int index) => emit(index);

  // create method that returns current page;
  int get currentPage => state;
}

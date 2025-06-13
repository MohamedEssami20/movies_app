import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'home_search_state.dart';

class HomeSearchCubit extends Cubit<HomeSearchState> {
  HomeSearchCubit() : super(HomeSearchInitial());

  // create method that enter search Mode;
  void enterSearchMode() {
    emit(HomeStateChanged(mode: HomeStateNow.search));
  }

  // create method that exit search Mode;
  void exitSearchMode() {
    emit(HomeStateChanged(mode: HomeStateNow.normal));
  }
}

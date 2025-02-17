import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'global_key_state.dart';

class GlobalKeyCubit extends Cubit<GlobalKey<FormState>> {
  GlobalKeyCubit() : super(GlobalKey());


  bool validateForm() {
    if (state.currentState!.validate()) {
      return true;
    }
    return false;
  }
}

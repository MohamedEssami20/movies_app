import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'global_key_state.dart';

class GlobalKeyCubit extends Cubit<GlobalKey<FormState>> {
  GlobalKeyCubit() : super(GlobalKey());

  GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  bool validateLoginForm() {
    if (loginKey.currentState != null && loginKey.currentState!.validate()) {
      log("login cubit State= true");
      return true;
    }
    log("login cubit State= false");
    return false;
  }

  bool validateSignupForm() {
    if (signupKey.currentState != null && signupKey.currentState!.validate()) {
      log("signup cubit state= true");
      return true;
    }
    log("signup cubit State= false");
    return false;
  }
}

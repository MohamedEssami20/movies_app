import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(
          AuthInitial(),
        );

  bool isSignup = true;

  void changeAuthState(int index) {
    isSignup = index == 0;
    emit(
      AuthTabCubit(isSignup: isSignup),
    );
  }
}

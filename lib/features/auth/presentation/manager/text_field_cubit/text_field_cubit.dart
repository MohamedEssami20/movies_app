import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  TextFieldCubit()
      : super(
          TextFieldInitial(),
        );

  bool isLoginpasswordvisable = true;
  bool isSignupPasswordVisable = true;
  bool isConfirmpasswordvisable = true;

  void changePasswordVisability() {
    isLoginpasswordvisable = !isLoginpasswordvisable;
    emit(
      IsVisiablePassword(isvisiablePassword: isLoginpasswordvisable),
    );
  }

  void changeConfirmPasswordVisability() {
    isConfirmpasswordvisable = !isConfirmpasswordvisable;
    emit(
      IsVisiablePassword(isvisiablePassword: isConfirmpasswordvisable),
    );
  }

  void changeSignupPasswordVisability() {
    isSignupPasswordVisable = !isSignupPasswordVisable;
    emit(
      IsVisiablePassword(isvisiablePassword: isSignupPasswordVisable),
    );
  }
}

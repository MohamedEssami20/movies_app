
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  TextFieldCubit()
      : super(
          TextFieldInitial(),
        );

  bool ispasswordvisable = true;
  bool isConfirmpasswordvisable = true;

  void changePasswordVisability() {
    ispasswordvisable = !ispasswordvisable;
    emit(
      IsVisiablePassword(isvisiablePassword: ispasswordvisable),
    );
  }

  void changeConfirmPasswordVisability() {  
    isConfirmpasswordvisable = !isConfirmpasswordvisable;
    emit(
      IsVisiablePassword(isvisiablePassword: isConfirmpasswordvisable),
    );
  }
}

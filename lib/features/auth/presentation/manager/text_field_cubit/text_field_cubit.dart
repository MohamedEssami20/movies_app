import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  TextFieldCubit()
      : super(
          TextFieldState(),
        );

  // create two global key variables;
  GlobalKey<FormFieldState> loginKey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> signupKey = GlobalKey<FormFieldState>();
  // create method to change visiable login password;
  void changeVisiableLoginPassword({required bool isVisiable}) {
    emit(
      state.copyWith(
        isLoginPasswordVisiable: isVisiable,
      ),
    );
  }

  //create method to change visiable signup password;
  void changeVisiableSignupPassword({required bool isVisiable}) {
    emit(
      state.copyWith(
        isSignupPasswordVisible: isVisiable,
      ),
    );
  }

  //create method that change confirm password visiable;
  void changeVisiableConfirmPassword({required bool isVisiable}) {
    emit(
      state.copyWith(
        isConfirmPasswordVisible: isVisiable,
      ),
    );
  }

  // create method that change validate login form;
  void changeValidateLoginForm({required AutovalidateMode validateMode}) {
    emit(
      state.copyWith(
        loginValidateMode: validateMode,
      ),
    );
  }

  // create method that change validate signup form;
  void changeValidateSignupForm({required AutovalidateMode validateMode}) {
    emit(
      state.copyWith(
        signupValidateMode: validateMode,
      ),
    );
  }

  //create that validate key of login form;
  bool validateLoginForm() {
    if (loginKey.currentState != null && loginKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  // create method that validate key of signup form;
  bool validateSignupForm() {
    if (signupKey.currentState != null && signupKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}

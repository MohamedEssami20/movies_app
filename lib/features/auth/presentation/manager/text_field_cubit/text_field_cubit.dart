import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  TextFieldCubit()
      : super(
          TextFieldState(),
        );

  // create all controller variables;
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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

  //create method that dispose all controllers;
  @override
  Future<void> close() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}

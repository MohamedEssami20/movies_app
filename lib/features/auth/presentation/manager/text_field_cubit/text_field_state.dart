part of 'text_field_cubit.dart';

@immutable
class TextFieldState {
  final bool isLoginPasswordVisiable;
  final bool isSignupPasswordVisible;
  final bool isConfirmPasswordVisible;
  final AutovalidateMode loginValidateMode;
  final AutovalidateMode signupValidateMode;

  const TextFieldState({
    this.isLoginPasswordVisiable = true,
    this.isSignupPasswordVisible = true,
    this.isConfirmPasswordVisible = true,
    this.loginValidateMode = AutovalidateMode.disabled,
    this.signupValidateMode = AutovalidateMode.disabled,
  });

  TextFieldState copyWith({
    bool? isLoginPasswordVisiable,
    bool? isSignupPasswordVisible,
    bool? isConfirmPasswordVisible,
    AutovalidateMode? loginValidateMode,
    AutovalidateMode? signupValidateMode,
  }) {
    return TextFieldState(
      isLoginPasswordVisiable:
          isLoginPasswordVisiable ?? this.isLoginPasswordVisiable,
      isSignupPasswordVisible:
          isSignupPasswordVisible ?? this.isSignupPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
      loginValidateMode: loginValidateMode ?? this.loginValidateMode,
      signupValidateMode: signupValidateMode ?? this.signupValidateMode,
    );
  }
}

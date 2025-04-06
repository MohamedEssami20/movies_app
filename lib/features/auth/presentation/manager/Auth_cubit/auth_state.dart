part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthTabCubit extends AuthState {
  final bool isSignup;

  AuthTabCubit({required this.isSignup});
}

// create all signup state;

final class SignupLoading extends AuthState {}

final class SignupSuccess extends AuthState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

final class SignupFailure extends AuthState {
  final String errorMessage;

  SignupFailure({required this.errorMessage});
}

// create all login states;

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final UserEntity userEntity;

  LoginSuccess({required this.userEntity});
}

final class LoginFailure extends AuthState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

// create all login with google states;

final class LoginWithGoogleLoading extends AuthState {}

final class LoginWithGoogleSuccess extends AuthState {
  final UserEntity userEntity;

  LoginWithGoogleSuccess({required this.userEntity});
}

final class LoginWithGoogleFailure extends AuthState {
  final String errorMessage;

  LoginWithGoogleFailure({required this.errorMessage});
}

// create all login with facebook states;

final class LoginWithFacebookLoading extends AuthState {}

final class LoginWithFacebookSuccess extends AuthState {
  final UserEntity userEntity;

  LoginWithFacebookSuccess({required this.userEntity});
}

final class LoginWithFacebookFailure extends AuthState {
  final String errorMessage;

  LoginWithFacebookFailure({required this.errorMessage});
}

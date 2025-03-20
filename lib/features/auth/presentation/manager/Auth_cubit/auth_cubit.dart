import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/domain/repos/auth_repos.dart';

import '../../../domain/entity/user_entity.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepos authRepos;
  AuthCubit(this.authRepos)
      : super(
          AuthInitial(),
        );

  bool isSignup = true;
  int tabIndex = 0;
  void changeAuthState(int index) {
    isSignup = index == 0;
    emit(
      AuthTabCubit(isSignup: isSignup),
    );
  }

  // create signup method;
  Future<void> signup({required String email, required String password}) async {
    emit(SignupLoading());
    final result = await authRepos.singup(email: email, password: password);
    result.fold(
      (error) => emit(SignupFailure(errorMessage: error.message)),
      (userEntity) => emit(
        SignupSuccess(userEntity: userEntity),
      ),
    );
  }

  // create login method;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await authRepos.login(email: email, password: password);
    result.fold(
      (error) => emit(LoginFailure(errorMessage: error.message)),
      (userEntity) => emit(
        LoginSuccess(userEntity: userEntity),
      ),
    );
  }

  // create login with google method;
  Future<void> loginWithGoogle() async {
    emit(LoginWithGoogleLoading());
    final result = await authRepos.signInWithGoogle();
    result.fold(
      (error) => emit(LoginWithGoogleFailure(errorMessage: error.message)),
      (userEntity) => emit(
        LoginWithGoogleSuccess(userEntity: userEntity),
      ),
    );
  }
}

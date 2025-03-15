// create auth repos implementaion
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/errors/firebase_signup_errors.dart';
import 'package:movies_app/core/services/firebase_auth_service.dart';
import 'package:movies_app/features/auth/data/models/user_model.dart';
import 'package:movies_app/features/auth/domain/entity/user_entity.dart';
import 'package:movies_app/features/auth/domain/repos/auth_repos.dart';

import '../../../../core/errors/firebase_login_errors.dart';

class AuthReposImpl extends AuthRepos {
  final FirebaseAuthService firebaseAuthService;

  AuthReposImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> login(
      {required String email, required String password}) async {
    User? user;
    try {
      user = await firebaseAuthService.signIn(email: email, password: password);
      UserEntity userEntity = UserModel.fromfirebase(user: user);
      return Right(userEntity);
    } on FirebaseLoginFailure catch (error) {
      return Left(
        Failure(error.message),
      );
    } catch (error) {
      return left(
        Failure("Unknown Error, try later"),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> singup(
      {required String email, required String password}) async {
    User? user;
    try {
      user = await firebaseAuthService.signUp(email: email, password: password);
      UserEntity userEntity = UserModel.fromfirebase(user: user);
      return right(userEntity);
    } on FirebaseSignupFailure catch (error) {
      return left(
        Failure(error.message),
      );
    } catch (error) {
      log("Signup error= ${error.toString()}");
      return left(
        Failure("Unknown Error, try later"),
      );
    }
  }
}

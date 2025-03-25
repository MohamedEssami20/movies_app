// create auth repos

import 'package:dartz/dartz.dart';
import 'package:movies_app/features/auth/domain/entity/user_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepos {
  // create signup repo;
  Future<Either<Failure, UserEntity>> singup(
      {required String email, required String password});

  // create login repo;
  Future<Either<Failure, UserEntity>> login(
      {required String email, required String password});

  // create login with google repo;
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  // create login with facebook repo;
  Future<Either<Failure, UserEntity>> signInWithFacebook();
}

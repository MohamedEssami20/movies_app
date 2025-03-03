// create auth repos

import 'package:dartz/dartz.dart';
import 'package:movies_app/features/auth/domain/entity/user_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepos {
  Future<Either<Failure, UserEntity>> singup(
      {required String email, required String password});
  Future<Either<Failure, UserEntity>> login(
      {required String email, required String password});
}

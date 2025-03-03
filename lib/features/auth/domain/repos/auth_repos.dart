// create auth repos  

import 'package:movies_app/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepos {
  Future<void> login(UserEntity userEntity);
  Future<void> signup(UserEntity userEntity);
}
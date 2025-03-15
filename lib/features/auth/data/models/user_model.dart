// create user model;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.uid,
  });

  factory UserModel.fromfirebase({required User user}) {
    return UserModel(
        email: user.email!, uid: user.uid);
  }

  factory UserModel.formJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      uid: map['uid'],
    );
  }

  factory UserModel.fromUserEntity(UserEntity user) {
    return UserModel(
      email: user.email,
      uid: user.uid,
    );
  }

  toMap() {
    return {
      "email": email,
      "uid": uid,
    };
  }
}

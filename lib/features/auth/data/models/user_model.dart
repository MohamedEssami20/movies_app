// create user model;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.userName,
    required super.uid,
  });

  factory UserModel.fromfirebase({required User user}) {
    return UserModel(
        email: user.email!, userName: user.displayName!, uid: user.uid);
  }

  factory UserModel.formJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      userName: map['userName'],
      uid: map['uid'],
    );
  }

  factory UserModel.fromUserEntity(UserEntity user) {
    return UserModel(
      email: user.email,
      userName: user.userName,
      uid: user.uid,
    );
  }

  toMap() {
    return {
      "email": email,
      "userName": userName,
      "uid": uid,
    };
  }
}

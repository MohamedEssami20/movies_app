// create firebase auth service
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/errors/firebase_signup_errors.dart';

import '../errors/firebase_login_errors.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // create method that signs in with email and password
  Future<User> signIn(String email, String password) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return user.user!;
    } on FirebaseAuthException catch (error) {
      throw FirebaseLoginFailure.fromFirebaseException(error.code.toString());
    } catch (anyError) {
      throw FirebaseLoginFailure('Unknown error, try later');
    }
  }

  // create method that signs up with email and password
  Future<User> signUp(String email, String password) async {
    try {
      final user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user.user!;
    } on FirebaseAuthException catch (error) {
      throw FirebaseSignupFailure.firebaseExecption(error.code.toString());
    } catch (unkownError) {
      throw FirebaseSignupFailure("Unknown error, try later");
    }
  }
}

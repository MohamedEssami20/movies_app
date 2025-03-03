// create Firebase signup failure
import 'package:movies_app/core/errors/failure.dart';

class FirebaseSignupFailure extends Failure {
  FirebaseSignupFailure(super.message);

  factory FirebaseSignupFailure.firebaseExecption(String code) {
    switch (code) {
      case 'email-already-in-use':
        return FirebaseSignupFailure('Email already in use.');
      case 'invalid-email':
        return FirebaseSignupFailure('Invalid email.');
      case 'weak-password':
        return FirebaseSignupFailure('Password is weak, try again.');
      case 'network-request-failed':
        return FirebaseSignupFailure('Enternet connection error, try later.');
      default:
        return FirebaseSignupFailure('Signup failed, try later.');
    }
  }
}
// create firebase auth service

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/errors/firebase_signup_errors.dart';

import '../errors/firebase_login_errors.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // create method that signs in with email and password
  Future<User> signIn({required String email, required String password}) async {
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
  Future<User> signUp({required String email, required String password}) async {
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

  // create method that signout user;
  Future<void> signOut() async => await firebaseAuth.signOut();

  // create method that delete user account;
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      try {
        await firebaseAuth.currentUser!.delete();
      } catch (error) {
        Failure("failed to delete user, try later.");
      }
    }
  }

  // create method that signin with google;
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    if (googleUser == null) {
      throw Failure("google signin was canceled");
    }
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user!;
  }

  // create method that login with facebook;
  Future<User?> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status != LoginStatus.success) {
      throw Failure("failed to login with facebook");
    }
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    return userCredential.user;
  }
}

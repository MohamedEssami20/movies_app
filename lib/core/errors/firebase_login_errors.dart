// create firebase login failure
import 'package:movies_app/core/errors/failure.dart'; 

class FirebaseLoginFailure extends Failure {
  FirebaseLoginFailure(super.message);
  

  factory FirebaseLoginFailure.fromFirebaseException(String code){
   switch(code){
     case 'user-not-found':
       return FirebaseLoginFailure('User not found.');
     case 'wrong-password':
       return FirebaseLoginFailure('Wrong password, try again.');
     case 'invalid-email':
       return FirebaseLoginFailure('Invalid email, try again.');
     case 'network-request-failed':
       return FirebaseLoginFailure('Enternet connection error, try again.'); 
     default:
       return FirebaseLoginFailure('Login failed');
   }
  }
}
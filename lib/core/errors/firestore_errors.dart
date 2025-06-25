import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/core/errors/failure.dart';

class FirestoreErrors extends Failure {
  FirestoreErrors(super.message);

  factory FirestoreErrors.fromCode(FirebaseException code) {
    switch (code.code) {
      case 'cancelled':
        return FirestoreErrors('The operation was cancelled.');
      case 'unknown':
        return FirestoreErrors('An unknown error occurred.');
      case 'invalid-argument':
        return FirestoreErrors('An invalid argument was provided.');
      case 'deadline-exceeded':
        return FirestoreErrors('The operation timed out.');
      case 'not-found':
        return FirestoreErrors('The requested document was not found.');
      case 'already-exists':
        return FirestoreErrors('The document already exists.');
      case 'permission-denied':
        return FirestoreErrors(
            'You do not have permission to access this data.');
      case 'resource-exhausted':
        return FirestoreErrors('Resource limit exceeded. Try again later.');
      case 'failed-precondition':
        return FirestoreErrors(
            'The operation was rejected due to a failed precondition.');
      case 'aborted':
        return FirestoreErrors('The operation was aborted.');
      case 'out-of-range':
        return FirestoreErrors('A value was out of the allowed range.');
      case 'unimplemented':
        return FirestoreErrors(
            'This operation is not implemented or supported.');
      case 'internal':
        return FirestoreErrors('An internal server error occurred.');
      case 'unavailable':
        return FirestoreErrors(
            'The service is currently unavailable. Please try again later.');
      case 'data-loss':
        return FirestoreErrors('Unrecoverable data loss or corruption.');
      case 'unauthenticated':
        return FirestoreErrors(
            'You must be authenticated to perform this operation.');
      default:
        return FirestoreErrors(
            'An unexpected error occurred. Please try again later.');
    }
  }
}

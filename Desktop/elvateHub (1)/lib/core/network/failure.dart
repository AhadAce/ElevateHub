import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure implements Exception {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromFirebaseException(FirebaseException e) {
    switch (e.code) {
      case 'network-request-failed':
        return ServerFailure('No internet connection.');
      case 'user-not-found':
        return ServerFailure('User not found. Please check your credentials.');
      case 'wrong-password':
        return ServerFailure('Incorrect password. Please try again.');
      case 'email-already-in-use':
        return ServerFailure('The email address is already in use.');
      case 'invalid-email':
        return ServerFailure('The email address is invalid.');
      case 'weak-password':
        return ServerFailure('The password is too weak.');
      case 'operation-not-allowed':
        return ServerFailure('This operation is not allowed.');
      case 'too-many-requests':
        return ServerFailure('Too many requests. Please try again later.');
      case 'user-disabled':
        return ServerFailure('This user account has been disabled.');
      case 'permission-denied':
        return ServerFailure(
            'Permission denied. You do not have access to this resource.');
      default:
        return ServerFailure('An unknown error occurred: ${e.message}');
    }
  }

  factory ServerFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return ServerFailure('User not found. Please check your credentials.');
      case 'wrong-password':
        return ServerFailure('Incorrect password. Please try again.');
      case 'email-already-in-use':
        return ServerFailure('This email is already in use.');
      case 'invalid-email':
        return ServerFailure('Invalid email address.');
      case 'weak-password':
        return ServerFailure('Password is too weak.');
      case 'operation-not-allowed':
        return ServerFailure('Operation not allowed.');
      case 'user-disabled':
        return ServerFailure('This user has been disabled.');
      default:
        return ServerFailure('Authentication failed: ${e.message}');
    }
  }

  // You can also add more Firebase-specific handling here if needed.
}

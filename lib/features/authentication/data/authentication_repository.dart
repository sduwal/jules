import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthenticationRepository {
  final auth.FirebaseAuth _firebaseAuth;

  AuthenticationRepository({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  Future<auth.User?> get user async {
    return _firebaseAuth.currentUser;
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_a_habbit_2/data/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserAuth?> signInWithEmainAndPassword(String email, String password) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return UserAuth.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future<UserAuth?> signUpWithEmainAndPassword(String email, String password) async {
    try {
      UserCredential result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return UserAuth.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }

  Future logOiut() async {
    await _auth.signOut();
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<String> getCurrentUID() async {
    return _auth.currentUser!.uid;
  }
}

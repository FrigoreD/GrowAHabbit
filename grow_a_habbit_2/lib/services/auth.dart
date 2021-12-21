import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:grow_a_habbit_2/data/user_data.dart';
import 'package:grow_a_habbit_2/services/database.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Future sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email.trim());
  }

  Future<OurUser?> signIn(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return _userFromFireBase(credential.user);
  }

  Future<String?> signUp(String email, String password, String nickName) async {
    final credential =
        await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password);
    _userFromFireBase(credential.user);
    OurUser _user = OurUser(
        uid: credential.user!.uid,
        email: credential.user!.email,
        nickName: nickName.trim(),
        habbit: []);
    return await OurDatabase().createUser(_user);
  }

  Stream<OurUser?>? get user {
    return _auth.authStateChanges().map(_userFromFireBase);
  }

  OurUser? _userFromFireBase(auth.User? user) {
    if (user == null) {
      return null;
    } else {
      return OurUser(uid: user.uid, email: user.email, nickName: user.displayName);
    }
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}

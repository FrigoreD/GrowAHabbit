import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:grow_a_habbit_2/data/user_data.dart';

import 'database.dart';

class AuthService extends ChangeNotifier {
  OurUser? _currentUser = OurUser();

  OurUser? get getCurrentUser => _currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> singinUser(String email, String password) async {
    String retVal = 'error';
    try {
      UserCredential _result =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      _currentUser!.uid = _result.user!.uid;
      _currentUser!.email = _result.user!.email;
      retVal = 'success';
    } catch (e) {
      return null;
    }
    return retVal;
  }

  Future<String?> signUpUser(String email, String password) async {
    String retVal = 'error';
    OurUser _user = OurUser();
    try {
      UserCredential _result =
          await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _user.uid = _result.user!.uid;
      _user.email = _result.user!.uid;
      String? _returnString = await OurDatabase().createUser(_user);
      if (_returnString == 'succes') {
        retVal = 'success';
      }
    } on PlatformException catch (e) {
      retVal = e.message!;
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Future<String?> logOut() async {
    String retVal = 'error';
    try {
      await _auth.signOut();
      _currentUser = OurUser();
      retVal = 'success';
    } catch (e) {
      print(e);
    }
    return retVal;
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();
}

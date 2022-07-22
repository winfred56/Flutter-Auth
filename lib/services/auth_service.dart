// This class is responsible for Firebase authentications
// Creates a user in Firebase and also gets user details from Firebase

import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{


// First create an Instance of the class FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

// A Function to handle Anonymous Sign In
  Future signInAnonymous() async {
    try {
      UserCredential results = await  _auth.signInAnonymously();
      UserCredential user = results;
      print(user);
      return results.user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async{
    try {
      UserCredential results = await _auth.signInWithEmailAndPassword(email: email, password: password);
      UserCredential user = results;
      print(user);
      return results.user;
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }


}
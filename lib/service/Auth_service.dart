import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService{
  //SingIN
  String UserID;
  String UserName;
  bool succ;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> SignInWithEmail(String email,String pass) async {
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email:email,
        password: pass))
                        .user;
        if(user!=null){
          UserID = user.uid;
          UserName = user.displayName;
          succ =true;
        }
    } catch (e) {
      succ = false;
    }
  }
  //getting UID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }
  //getting Name
  Future<String> getCurrentName() async {
    return (await _auth.currentUser()).displayName;
  }
  //SignUp
  Future<void> SignUpWithEmail(String email,String pass) async {
    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
          email: email,
          password: pass))
                          .user;
    } catch (e) {
      succ = false;
    }
  }
  //Recover Password
  Future<void> sendPasswordResetEmail(String email) async {
    return _auth.sendPasswordResetEmail(email: email);
  }
  //google sign in
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> googleSignIn() async {
    try{
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser user =
      (await _auth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    } catch(e) {
      print(e.toString());
    }
  }
}
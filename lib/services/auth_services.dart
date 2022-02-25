import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

class AuthService{
  final FirebaseAuth _auth;
  AuthService(this._auth);


  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<Object> login(String Email, String password)async{
    try{
      await _auth.signInWithEmailAndPassword(email: Email, password: password);
      return "Logged In";
    }catch(e){
      return e;
    }
  }
  Future<Object> signUp(String Email, String password)async{
    try{
      await _auth.createUserWithEmailAndPassword(email: Email, password: password);
      return "Signd Up";
    }catch(e){
      return e;
    }
  }
}
import 'package:citycafe_app/screens/Home.dart';
import 'package:citycafe_app/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get uid
  Future<String> getCurrintUID() async {
    return await _auth.currentUser!.uid;
  }

// login  with email and password
  Future logInWithEmailAndPassword(
      String email, String password, context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("sorry there is an error")));
    }
  }

  //logIn With UserName And Password
  Future logInWithUserNameAndPassword(
      String userName, String password, context) async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection("UsersData")
        .where("username", isEqualTo: userName)
        .get();

    await _auth.signInWithEmailAndPassword(
        email: snap.docs[0]["email"], password: password);
  }

  // signUp with email and password
  Future signUpWithEmailAndPassword(
      String email, String password, context) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(
          context,
          MaterialPageRoute(
            builder: (context) => Login_screen(),
          ));
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("sorry there is an error")));
    }
  }

//signUp With UserName Email And Password
  Future signUpWithUserNameEmailAndPassword(
      String email, String password, String userName, context) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseFirestore.instance
          .collection("UsersData")
          .add({"username": userName, "email": email, "admin": false});
      Navigator.pop(
          context,
          MaterialPageRoute(
            builder: (context) => Login_screen(),
          ));
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("sorry there is an error")));
    }
  }

  //Determine if the user is authenticated.
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return const Login_screen();
          }
        });
  }

  //google login
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // sign out
  Future signOut(context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const Login_screen(),
        ),
      );
    } catch (error) {
      print(error.toString());
    }
  }

  signout() {
    FirebaseAuth.instance.signOut();
  }

  Future getUserData() async {
    return FirebaseFirestore.instance
        .collection("UsersData")
        .where("email", isEqualTo: _auth.currentUser!.email)
        .get();
  }

  Future resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (err) {
      throw err;
    }
  }
}

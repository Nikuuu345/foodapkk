import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:food/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      // print("signed in " + user.displayName);

      return user;
    } catch (e) {
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/bg4.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Sign in to continue",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Rail Food",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      shadows: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Colors.white,
                            offset: Offset(3, 3)),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SignInButton(
                        Buttons.Twitter,
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Google,
                        text: "Sign up with Google",
                        onPressed: () {
                          _googleSignUp().then((value) => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => (HomeScreen()),
                           )));
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "By signing in you are agreeing to our",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Terms and privacy policy",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tindermovies/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
      'openid',
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Stream<User> get user => _auth.onAuthStateChanged.map((user) {
    if (user == null) {
      return null;
    } else {
      return User.fromFirebaseUser(user);
    }
  });

  // Sign in with Google
  Future<User> signInWithGoogle() async {
    try {
      GoogleSignInAccount _user = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleAuth = await _user.authentication;
      AuthCredential _credential = GoogleAuthProvider.getCredential(
        idToken: _googleAuth.idToken,
        accessToken: _googleAuth.accessToken,
      );
      AuthResult authResult = await _auth.signInWithCredential(_credential);
      return User.fromFirebaseUser(authResult.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign In with Facebook credentials
  Future<User> sigInWithFacebook() async {
    FacebookLogin _fbLogin = FacebookLogin();

    final result = await _fbLogin.logIn(['email']);
    final token = result.accessToken.token;

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        _auth.signInWithCredential(
          FacebookAuthProvider.getCredential(accessToken: token))
          .then((onValue) {
            User user = User.fromFirebaseUser(onValue.user);
            return user;
        }).catchError((e) {
          print(e.toString());
          return null;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        return null;
        break;
      case FacebookLoginStatus.error:
        return null;
        break;
    }
  }

  // Sign in with email and password
  Future<User> signInEmailPass(String email, String pass) async {
    try {
      AuthResult result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return User.fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future<User> signUpEmailPass(String email, String pass) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      FirebaseUser user = result.user;
      return User.fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign out
  Future singOut() async {
    try {
      await _googleSignIn.signOut();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

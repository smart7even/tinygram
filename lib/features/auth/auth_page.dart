import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tinygram/common.dart';
import 'package:tinygram/routing.dart';
import 'package:tinygram/user_photo.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      GoogleSignIn().signOut().then((value) {
        signIn();
      });
    } else {
      AutoRouter.of(context).replaceAll(
        [const HomeRoute()],
      );
    }
  }

  Future<void> signIn() async {
    final userCredential = await signInWithGoogle();

    if (userCredential != null) {
      debugPrint(userCredential.user.toString());
      setState(() {
        user = userCredential.user;
      });
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().disconnect();
    setState(() {
      user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {},
          child: Text(appLocalizations.helloWorld),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your name:',
            ),
            Text(
              user?.displayName ?? '',
              style: Theme.of(context).textTheme.headline4,
            ),
            UserPhoto(user: user)
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'sign_in',
            onPressed: signIn,
            tooltip: 'Sign In',
            child: const Icon(Icons.login),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            heroTag: 'sign_out',
            onPressed: signOut,
            tooltip: 'Sign Out',
            child: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}

Future<UserCredential?> signInWithGoogle() async {
  // Trigger the authentication flow
  final googleUser = await GoogleSignIn().signIn();

  if (googleUser == null) {
    return null;
  }

  // Obtain the auth details from the request
  final googleAuth = await googleUser.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(credential);
}

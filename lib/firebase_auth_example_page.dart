import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tinygram/common.dart';
import 'package:tinygram/user_photo.dart';

class FirebaseAuthExamplePage extends StatefulWidget {
  const FirebaseAuthExamplePage({Key? key}) : super(key: key);

  @override
  State<FirebaseAuthExamplePage> createState() =>
      _FirebaseAuthExamplePageState();
}

class _FirebaseAuthExamplePageState extends State<FirebaseAuthExamplePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      signIn();
    }
  }

  Future<void> signIn() async {
    final userCredential = await signInWithGoogle();
    debugPrint(userCredential.user.toString());
    setState(() {
      user = userCredential.user;
    });
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
            onPressed: signIn,
            tooltip: 'Increment',
            child: const Icon(Icons.login),
          ),
          const SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: signOut,
            tooltip: 'Increment',
            child: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(credential);
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/home/presentation/pages/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      debugPrint('User is currently signed out!');
    } else {
      debugPrint('User is signed in!');
    }
  });

  runApp(const MyApp());
}

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinygram',
      theme: ThemeData(
          primaryColor: const Color(0xFF517DA2),
          fontFamily: 'Roboto',
          textTheme: const TextTheme(
              bodyText1: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              headline2: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.black))),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FirebaseAuthExamplePage extends StatefulWidget {
  const FirebaseAuthExamplePage({Key? key, required this.title})
      : super(key: key);

  final String title;

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

  void signIn() async {
    var userCredential = await signInWithGoogle();
    debugPrint(userCredential.user.toString());
    setState(() {
      user = userCredential.user;
    });
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().disconnect();
    setState(() {
      user = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Your name:',
              ),
              Text(
                user?.displayName ?? "",
                style: Theme.of(context).textTheme.headline4,
              ),
              if (user != null && user!.photoURL != null)
                Image.network(user!.photoURL!)
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
        ));
  }
}

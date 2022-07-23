import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tinygram/firebase_auth_example_page.dart';

import 'package:tinygram/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      debugPrint('User is currently signed out!');
    } else {
      debugPrint('User is signed in!');
      debugPrint(user.uid);
      debugPrint(await user.getIdToken());
    }
  });

  runApp(
    const MyApp(
      label: 'Hello world',
    ),
  );
}

class MyApp extends StatelessWidget {
  final String label;

  const MyApp({Key? key, required this.label}) : super(key: key);

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
            color: Colors.black,
          ),
        ),
      ),
      home: const FirebaseAuthExamplePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

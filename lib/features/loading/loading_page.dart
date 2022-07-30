import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinygram/routing.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    final router = AutoRouter.of(context);
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        debugPrint('User is currently signed out!');
        await router.replaceAll([const AuthRoute()]);
      } else {
        debugPrint('User is signed in!');
        debugPrint(user.uid);
        final token = await user.getIdToken();
        debugPrint(token.length.toString());
        log(token);
        await router.replaceAll([const HomeRoute()]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

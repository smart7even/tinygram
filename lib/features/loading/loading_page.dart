import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinygram/constants.dart';
import 'package:tinygram/features/auth/dao/auth_dao.dart';
import 'package:tinygram/features/auth/repository/auth_repository.dart';
import 'package:tinygram/routing.gr.dart';

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

        final authRepository = AuthRepository(
          authDAO: AuthDAO(
            dio: Dio(
              BaseOptions(baseUrl: kServerURL),
            ),
          ),
        );

        final appToken = await authRepository.getAppToken(token);

        log(appToken);

        await router.replaceAll([
          HomeRoute(token: appToken),
        ]);
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

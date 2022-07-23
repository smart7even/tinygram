import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  final User? user;

  const UserPhoto({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUserPhoto = user?.photoURL;

    if (currentUserPhoto == null) {
      return const SizedBox.shrink();
    }

    return Image.network(currentUserPhoto);
  }
}

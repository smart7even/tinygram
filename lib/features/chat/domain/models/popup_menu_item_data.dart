import 'package:flutter/material.dart';

class PopupMenuItemData {
  final String title;
  final VoidCallback onPressed;
  final Widget icon;

  PopupMenuItemData(
      {required this.title, required this.onPressed, required this.icon});
}

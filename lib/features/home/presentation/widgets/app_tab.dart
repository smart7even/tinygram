import 'package:flutter/material.dart';
import 'package:tinygram/constants.dart';

class AppTab extends StatelessWidget {
  const AppTab(
      {Key? key, required this.title, required this.unreadMessagesCounter})
      : super(key: key);

  final String title;
  final int unreadMessagesCounter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Text(title),
          if (unreadMessagesCounter != 0)
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                decoration: BoxDecoration(
                    color: const Color(0xFFFDFBF8),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(left: 4),
                child: Text(unreadMessagesCounter.toString(),
                    style: TextStyle(color: AppColors.darkBlue)))
        ],
      ),
    );
  }
}

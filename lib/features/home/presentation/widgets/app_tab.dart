import 'package:flutter/material.dart';
import 'package:tinygram/constants.dart';

class AppTab extends StatelessWidget {
  final String title;
  final int unreadMessagesCounter;

  const AppTab({
    Key? key,
    required this.title,
    required this.unreadMessagesCounter,
  }) : super(key: key);

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
              decoration: const BoxDecoration(
                color: Color(0xFFFDFBF8),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                unreadMessagesCounter.toString(),
                style: const TextStyle(color: AppColors.darkBlue),
              ),
            )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tinygram/constants.dart';
import 'package:tinygram/features/chat/domain/models/popup_menu_item_data.dart';
import 'package:tinygram/features/chat/presentation/widgets/popup_dropdown_button.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key, required this.title, required this.imagePath})
      : super(key: key);

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.darkBlue,
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                imagePath,
                height: 40,
                width: 40,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    "6552 members, 2800 online",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.white.withOpacity(0.9)),
                  )
                ],
              ),
            )
          ],
        ),
        actions: [
          PopupMenuButtonAppBar(
            popupItems: [
              PopupMenuItemData(
                  title: 'Search',
                  icon: Icon(
                    Icons.search,
                    color: AppColors.grey,
                    size: 27,
                  ),
                  onPressed: () {}),
              PopupMenuItemData(
                  title: 'Report',
                  icon: Icon(
                    Icons.report,
                    color: AppColors.grey,
                    size: 27,
                  ),
                  onPressed: () {}),
              PopupMenuItemData(
                  title: 'Unmute',
                  icon: Icon(
                    Icons.volume_up,
                    color: AppColors.grey,
                    size: 27,
                  ),
                  onPressed: () {}),
              PopupMenuItemData(
                  title: 'Leave group',
                  icon: Icon(
                    Icons.logout,
                    color: AppColors.grey,
                    size: 27,
                  ),
                  onPressed: () {})
            ],
          )
        ],
      ),
      body: const Center(
        child: Text("Chat page"),
      ),
    );
  }
}

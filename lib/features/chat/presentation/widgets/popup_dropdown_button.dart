import 'package:flutter/material.dart';
import 'package:tinygram/features/chat/domain/models/popup_menu_item_data.dart';

class PopupMenuButtonAppBar extends StatelessWidget {
  final List<PopupMenuItemData> popupItems;

  const PopupMenuButtonAppBar({Key? key, required this.popupItems})
      : super(key: key);

  List<PopupMenuEntry<String>> _buildItems(BuildContext context) {
    return popupItems.map((PopupMenuItemData choice) {
      return PopupMenuItem<String>(
        value: choice.title,
        child: Row(
          children: [
            choice.icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              choice.title,
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (newStr) {},
      itemBuilder: _buildItems,
    );
  }
}

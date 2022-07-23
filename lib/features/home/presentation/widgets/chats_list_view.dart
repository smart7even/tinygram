import 'package:flutter/material.dart';
import 'package:tinygram/features/chat/presentation/pages/chat_page.dart';
import 'package:tinygram/features/home/domain/models/chat_tile_info.dart';

import 'package:tinygram/features/home/presentation/widgets/chat_tile.dart';

class ChatsListView extends StatelessWidget {
  final List<ChatTileInfo> chatsInfo;

  const ChatsListView({Key? key, required this.chatsInfo}) : super(key: key);

  void onChatPageOpen(BuildContext context, ChatTileInfo chatInfo) {
    Navigator.of(context).push<MaterialPageRoute>(
      MaterialPageRoute(
        builder: (ctx) {
          return ChatPage(
            title: chatInfo.title,
            imagePath: chatInfo.imagePath,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ChatTile(
          chatTileInfo: chatsInfo[index],
          onPressed: () => onChatPageOpen(context, chatsInfo[index]),
        );
      },
    );
  }
}

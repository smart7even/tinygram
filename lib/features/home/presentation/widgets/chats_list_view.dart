import 'package:flutter/material.dart';
import 'package:tinygram/features/chat/presentation/pages/chat_page.dart';
import 'package:tinygram/features/home/domain/models/chat_tile_info.dart';

import 'chat_tile.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({Key? key, required this.chatsInfo}) : super(key: key);

  final List<ChatTileInfo> chatsInfo;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: List.generate(chatsInfo.length, (index) {
      final chatInfo = chatsInfo[index];
      return ChatTile(
        chatTileInfo: chatInfo,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return ChatPage(
                title: chatInfo.title, imagePath: chatInfo.imagePath);
          }));
        },
      );
    })));
  }
}

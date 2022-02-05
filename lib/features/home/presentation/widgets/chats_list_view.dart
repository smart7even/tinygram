import 'package:flutter/material.dart';
import 'package:tinygram/features/chat/presentation/pages/chat_page.dart';

import 'chat_tile.dart';

class ChatsListView extends StatelessWidget {
  const ChatsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: List.generate(
                10,
                (index) => ChatTile(
                      title: 'Dart & Flutter',
                      lastMessageSender: 'Yoda',
                      lastMessage: 'May the force be with you',
                      lastMessageSentAt: '18:43',
                      unreadMessages: 13 * index + 1,
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (ctx) {
                          return const ChatPage(
                            title: 'Dart & Flutter',
                            imagePath: 'assets/images/dartchat.jpg',
                          );
                        }));
                      },
                    ))));
  }
}

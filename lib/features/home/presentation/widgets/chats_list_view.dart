import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinygram/features/chat/repository/i_user_repository.dart';
import 'package:tinygram/features/home/domain/models/chat_tile_info.dart';
import 'package:tinygram/features/home/presentation/widgets/chat_tile.dart';
import 'package:tinygram/routing.gr.dart';

class ChatsListView extends StatelessWidget {
  final List<ChatTileInfo> chatsInfo;

  const ChatsListView({Key? key, required this.chatsInfo}) : super(key: key);

  void onChatPageOpen(BuildContext context, ChatTileInfo chatInfo) {
    AutoRouter.of(context).push(
      ChatRoute(
        title: chatInfo.title,
        imagePath: chatInfo.imagePath,
        token: context.read<IUserRepository>().getUser().token,
        chatId: chatInfo.id,
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
      itemCount: chatsInfo.length,
    );
  }
}

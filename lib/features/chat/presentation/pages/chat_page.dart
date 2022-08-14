import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinygram/constants.dart';
import 'package:tinygram/features/chat/bloc/chat_bloc.dart';
import 'package:tinygram/features/chat/dao/chat_dao.dart';
import 'package:tinygram/features/chat/domain/models/popup_menu_item_data.dart';
import 'package:tinygram/features/chat/presentation/widgets/message_tile.dart';
import 'package:tinygram/features/chat/presentation/widgets/popup_dropdown_button.dart';
import 'package:tinygram/features/chat/repository/chat_repository.dart';

class ChatPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String token;
  final String chatId;

  const ChatPage({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.token,
    required this.chatId,
  }) : super(key: key);

  ChatBloc createChatBloc() {
    final bloc = ChatBloc(
      initialState: ChatState.initial(chatId: chatId, messages: []),
      repository: ChatRepository(
        chatDAO: ChatDAO(
          dio: Dio(
            BaseOptions(
              baseUrl: kServerURL,
              headers: <String, String>{
                'token': token,
              },
            ),
          ),
        ),
      ),
    );
    bloc.add(ChatEvent.loadingStarted());

    return bloc;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createChatBloc(),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
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
                          '6552 members, 2800 online',
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
                      icon: const Icon(
                        Icons.search,
                        color: AppColors.grey,
                        size: 27,
                      ),
                      onPressed: () {},
                    ),
                    PopupMenuItemData(
                      title: 'Report',
                      icon: const Icon(
                        Icons.report,
                        color: AppColors.grey,
                        size: 27,
                      ),
                      onPressed: () {},
                    ),
                    PopupMenuItemData(
                      title: 'Unmute',
                      icon: const Icon(
                        Icons.volume_up,
                        color: AppColors.grey,
                        size: 27,
                      ),
                      onPressed: () {},
                    ),
                    PopupMenuItemData(
                      title: 'Leave group',
                      icon: const Icon(
                        Icons.logout,
                        color: AppColors.grey,
                        size: 27,
                      ),
                      onPressed: () {},
                    )
                  ],
                )
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    color: AppColors.blue,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) {
                        final message = state.messages[index];

                        return MessageTile(message: message);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: state.messages.length,
                    ),
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Message',
                        ),
                        maxLines: 5,
                        minLines: 1,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      constraints: const BoxConstraints(
                        maxHeight: 82,
                      ),
                      splashRadius: 20,
                      color: Theme.of(context).primaryColorDark,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 15,
                      ),
                      icon: const Icon(Icons.send),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

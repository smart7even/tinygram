import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinygram/constants.dart';
import 'package:tinygram/features/chat/bloc/chat_bloc.dart';
import 'package:tinygram/features/chat/dao/chat_dao.dart';
import 'package:tinygram/features/chat/domain/models/popup_menu_item_data.dart';
import 'package:tinygram/features/chat/presentation/widgets/message_text_field.dart';
import 'package:tinygram/features/chat/presentation/widgets/message_tile.dart';
import 'package:tinygram/features/chat/presentation/widgets/popup_dropdown_button.dart';
import 'package:tinygram/features/chat/repository/chat_repository.dart';

class ChatPage extends StatefulWidget {
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

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  ChatBloc createChatBloc() {
    final bloc = ChatBloc(
      initialState: ChatState.initial(chatId: widget.chatId, messages: []),
      repository: ChatRepository(
        chatDAO: ChatDAO(
          dio: Dio(
            BaseOptions(
              baseUrl: kServerURL,
              headers: <String, String>{
                'token': widget.token,
              },
            ),
          ),
        ),
      ),
    );
    bloc.add(ChatEvent.loadingStarted());

    return bloc;
  }

  void onChatBlocUpdate(BuildContext context, ChatState state) {
    state.mapOrNull(
      messageSendingComplete: (value) async {
        await WidgetsBinding.instance.endOfFrame.then((value) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.bounceIn,
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createChatBloc(),
      child: BlocConsumer<ChatBloc, ChatState>(
        listener: onChatBlocUpdate,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.darkBlue,
              title: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      widget.imagePath,
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
                          widget.title,
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
                      controller: scrollController,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                const MessageTextField(),
              ],
            ),
          );
        },
      ),
    );
  }
}

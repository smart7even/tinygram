import 'package:flutter/material.dart';
import 'package:tinygram/constants.dart';
import 'package:tinygram/features/home/domain/models/chat_tile_info.dart';
import 'package:tinygram/features/home/presentation/widgets/app_tab.dart';
import 'package:tinygram/features/home/presentation/widgets/chats_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final List<ChatTileInfo> chatsInfo = [
    ChatTileInfo(
      title: 'Dart & Flutter',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 33,
      imagePath: 'assets/images/dartchat.jpg',
    ),
    ChatTileInfo(
      title: 'Python',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 1147,
      imagePath: 'assets/images/pythonchat.jpg',
    ),
    ChatTileInfo(
      title: 'Vue',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 12345,
      imagePath: 'assets/images/vuechat.jpg',
    ),
    ChatTileInfo(
      title: 'Dart & Flutter',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 33,
      imagePath: 'assets/images/dartchat.jpg',
    ),
    ChatTileInfo(
      title: 'Python',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 1147,
      imagePath: 'assets/images/pythonchat.jpg',
    ),
    ChatTileInfo(
      title: 'Vue',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 12345,
      imagePath: 'assets/images/vuechat.jpg',
    ),
    ChatTileInfo(
      title: 'Dart & Flutter',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 33,
      imagePath: 'assets/images/dartchat.jpg',
    ),
    ChatTileInfo(
      title: 'Python',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 1147,
      imagePath: 'assets/images/pythonchat.jpg',
    ),
    ChatTileInfo(
      title: 'Vue',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 12345,
      imagePath: 'assets/images/vuechat.jpg',
    ),
    ChatTileInfo(
      title: 'Dart & Flutter',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 33,
      imagePath: 'assets/images/dartchat.jpg',
    ),
    ChatTileInfo(
      title: 'Python',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 1147,
      imagePath: 'assets/images/pythonchat.jpg',
    ),
    ChatTileInfo(
      title: 'Vue',
      lastMessageSender: 'Yoda',
      lastMessage: 'May the force be with you',
      lastMessageSentAt: '18:43',
      unreadMessages: 12345,
      imagePath: 'assets/images/vuechat.jpg',
    )
  ];

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: const Text('Tinygram'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              isScrollable: true,
              controller: tabController,
              indicatorColor: const Color(0xFFFDFBF8),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                AppTab(
                  title: 'All',
                  unreadMessagesCounter: 10,
                ),
                AppTab(
                  title: 'Personal',
                  unreadMessagesCounter: 0,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.edit),
      ),
      drawer: const Drawer(),
      body: TabBarView(
        controller: tabController,
        children: [
          ChatsListView(chatsInfo: chatsInfo),
          const Center(
            child: Text('Personal messages'),
          )
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tinygram/constants.dart';
import 'package:tinygram/features/chat/bloc/chats_bloc.dart';
import 'package:tinygram/features/chat/dao/chats_dao.dart';
import 'package:tinygram/features/chat/domain/models/app_user.dart';
import 'package:tinygram/features/chat/repository/chats_repository.dart';
import 'package:tinygram/features/chat/repository/user_repository.dart';
import 'package:tinygram/features/home/domain/models/chat_tile_info.dart';
import 'package:tinygram/features/home/presentation/widgets/app_tab.dart';
import 'package:tinygram/features/home/presentation/widgets/chats_list_view.dart';
import 'package:tinygram/routing.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
  User? user;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      final router = AutoRouter.of(context);

      router.replaceAll([const AuthRoute()]);
    }
  }

  Future<void> onSignOut() async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
  }

  ChatsBloc createChatsBLoC() {
    final bloc = ChatsBloc(
      repository: ChatsRepository(
        chatsDAO: ChatsDAO(
          dio: Dio(
            BaseOptions(baseUrl: kServerURL),
          ),
        ),
      ),
    );
    bloc.add(const ChatsEvent.loadingStarted());

    return bloc;
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = user;

    if (currentUser == null) {
      return Container();
    }

    return RepositoryProvider(
      create: (context) => UserRepository(user: AppUser(user: currentUser)),
      child: BlocProvider(
        create: (context) => createChatsBLoC(),
        child: Scaffold(
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
            heroTag: 'edit_button',
            onPressed: () {},
            elevation: 0,
            backgroundColor: AppColors.blue,
            child: const Icon(Icons.edit),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: onSignOut,
                  child: const Text('Logout'),
                )
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              BlocBuilder<ChatsBloc, ChatsState>(
                builder: (context, state) {
                  return state.map(
                    initial: (value) {
                      return const Text('Initial state');
                    },
                    loading: (value) {
                      return const Text('Chats are loading');
                    },
                    error: (value) {
                      return const Text('Error while loading chats');
                    },
                    ready: (value) {
                      return ChatsListView(
                        chatsInfo: value.chats
                            .map(
                              (e) => ChatTileInfo(
                                title: e.name,
                                lastMessageSender: 'Yoda',
                                lastMessage: 'May the force be with you',
                                lastMessageSentAt: '18:43',
                                unreadMessages: 1147,
                                imagePath: 'assets/images/pythonchat.jpg',
                              ),
                            )
                            .toList(),
                      );
                    },
                  );
                },
              ),
              const Center(
                child: Text('Personal messages'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

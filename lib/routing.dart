// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:tinygram/features/auth/auth_page.dart';
import 'package:tinygram/features/chat/presentation/pages/chat_page.dart';
import 'package:tinygram/features/home/presentation/pages/home.dart';
import 'package:tinygram/features/loading/loading_page.dart';

export 'routing.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<LoadingPage>(page: LoadingPage, initial: true),
    AutoRoute<HomePage>(page: HomePage),
    AutoRoute<AuthPage>(page: AuthPage),
    AutoRoute<ChatPage>(page: ChatPage),
  ],
)
class $AppRouter {}

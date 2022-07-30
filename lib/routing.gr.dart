// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'routing.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return MaterialPageX<LoadingPage>(
          routeData: routeData, child: const LoadingPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<HomePage>(
          routeData: routeData, child: const HomePage());
    },
    AuthRoute.name: (routeData) {
      return MaterialPageX<AuthPage>(
          routeData: routeData, child: const AuthPage());
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return MaterialPageX<ChatPage>(
          routeData: routeData,
          child: ChatPage(
              key: args.key, title: args.title, imagePath: args.imagePath));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(LoadingRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/home-page'),
        RouteConfig(AuthRoute.name, path: '/auth-page'),
        RouteConfig(ChatRoute.name, path: '/chat-page')
      ];
}

/// generated route for
/// [LoadingPage]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '/');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: '/auth-page');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [ChatPage]
class ChatRoute extends PageRouteInfo<ChatRouteArgs> {
  ChatRoute({Key? key, required String title, required String imagePath})
      : super(ChatRoute.name,
            path: '/chat-page',
            args: ChatRouteArgs(key: key, title: title, imagePath: imagePath));

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.title, required this.imagePath});

  final Key? key;

  final String title;

  final String imagePath;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, title: $title, imagePath: $imagePath}';
  }
}

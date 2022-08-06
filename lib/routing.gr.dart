// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import 'features/auth/auth_page.dart' as _i3;
import 'features/chat/presentation/pages/chat_page.dart' as _i4;
import 'features/home/presentation/pages/home.dart' as _i2;
import 'features/loading/loading_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoadingRoute.name: (routeData) {
      return _i5.MaterialPageX<_i1.LoadingPage>(
          routeData: routeData, child: const _i1.LoadingPage());
    },
    HomeRoute.name: (routeData) {
      return _i5.MaterialPageX<_i2.HomePage>(
          routeData: routeData, child: const _i2.HomePage());
    },
    AuthRoute.name: (routeData) {
      return _i5.MaterialPageX<_i3.AuthPage>(
          routeData: routeData, child: const _i3.AuthPage());
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i5.MaterialPageX<_i4.ChatPage>(
          routeData: routeData,
          child: _i4.ChatPage(
              key: args.key, title: args.title, imagePath: args.imagePath));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LoadingRoute.name, path: '/'),
        _i5.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i5.RouteConfig(AuthRoute.name, path: '/auth-page'),
        _i5.RouteConfig(ChatRoute.name, path: '/chat-page')
      ];
}

/// generated route for
/// [_i1.LoadingPage]
class LoadingRoute extends _i5.PageRouteInfo<void> {
  const LoadingRoute() : super(LoadingRoute.name, path: '/');

  static const String name = 'LoadingRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.AuthPage]
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: '/auth-page');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i4.ChatPage]
class ChatRoute extends _i5.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({_i6.Key? key, required String title, required String imagePath})
      : super(ChatRoute.name,
            path: '/chat-page',
            args: ChatRouteArgs(key: key, title: title, imagePath: imagePath));

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.title, required this.imagePath});

  final _i6.Key? key;

  final String title;

  final String imagePath;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, title: $title, imagePath: $imagePath}';
  }
}

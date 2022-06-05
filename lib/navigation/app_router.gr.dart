// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../ui/screen/screen_1.dart' as _i2;
import '../ui/screen/screen_2.dart' as _i3;
import '../ui/screen/user_posts.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    UserPosts.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.UserPosts());
    },
    Screen1.name: (routeData) {
      final args =
          routeData.argsAs<Screen1Args>(orElse: () => const Screen1Args());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.Screen1(key: args.key));
    },
    Screen2.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Screen2());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: '/user_post', fullMatch: true),
        _i4.RouteConfig(UserPosts.name, path: '/user_post'),
        _i4.RouteConfig(Screen1.name, path: '/screen1'),
        _i4.RouteConfig(Screen2.name, path: '/screen2')
      ];
}

/// generated route for
/// [_i1.UserPosts]
class UserPosts extends _i4.PageRouteInfo<void> {
  const UserPosts() : super(UserPosts.name, path: '/user_post');

  static const String name = 'UserPosts';
}

/// generated route for
/// [_i2.Screen1]
class Screen1 extends _i4.PageRouteInfo<Screen1Args> {
  Screen1({_i5.Key? key})
      : super(Screen1.name, path: '/screen1', args: Screen1Args(key: key));

  static const String name = 'Screen1';
}

class Screen1Args {
  const Screen1Args({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'Screen1Args{key: $key}';
  }
}

/// generated route for
/// [_i3.Screen2]
class Screen2 extends _i4.PageRouteInfo<void> {
  const Screen2() : super(Screen2.name, path: '/screen2');

  static const String name = 'Screen2';
}

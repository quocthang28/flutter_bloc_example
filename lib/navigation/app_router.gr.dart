// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../ui/screen/auth_screen/login_screen.dart' as _i1;
import '../ui/screen/auth_screen/register_screen.dart' as _i2;
import '../ui/screen/screen_1.dart' as _i4;
import '../ui/screen/screen_2.dart' as _i5;
import '../ui/screen/user_posts.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) {
      final args = routeData.argsAs<LoginScreenArgs>(
          orElse: () => const LoginScreenArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginScreen(key: args.key));
    },
    RegisterScreen.name: (routeData) {
      final args = routeData.argsAs<RegisterScreenArgs>(
          orElse: () => const RegisterScreenArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.RegisterScreen(key: args.key));
    },
    UserPosts.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.UserPosts());
    },
    Screen1.name: (routeData) {
      final args =
          routeData.argsAs<Screen1Args>(orElse: () => const Screen1Args());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.Screen1(key: args.key));
    },
    Screen2.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.Screen2());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i6.RouteConfig(LoginScreen.name, path: '/login'),
        _i6.RouteConfig(RegisterScreen.name, path: '/register'),
        _i6.RouteConfig(UserPosts.name, path: '/user_post'),
        _i6.RouteConfig(Screen1.name, path: '/screen1'),
        _i6.RouteConfig(Screen2.name, path: '/screen2')
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreen extends _i6.PageRouteInfo<LoginScreenArgs> {
  LoginScreen({_i7.Key? key})
      : super(LoginScreen.name,
            path: '/login', args: LoginScreenArgs(key: key));

  static const String name = 'LoginScreen';
}

class LoginScreenArgs {
  const LoginScreenArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LoginScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterScreen extends _i6.PageRouteInfo<RegisterScreenArgs> {
  RegisterScreen({_i7.Key? key})
      : super(RegisterScreen.name,
            path: '/register', args: RegisterScreenArgs(key: key));

  static const String name = 'RegisterScreen';
}

class RegisterScreenArgs {
  const RegisterScreenArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'RegisterScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.UserPosts]
class UserPosts extends _i6.PageRouteInfo<void> {
  const UserPosts() : super(UserPosts.name, path: '/user_post');

  static const String name = 'UserPosts';
}

/// generated route for
/// [_i4.Screen1]
class Screen1 extends _i6.PageRouteInfo<Screen1Args> {
  Screen1({_i7.Key? key})
      : super(Screen1.name, path: '/screen1', args: Screen1Args(key: key));

  static const String name = 'Screen1';
}

class Screen1Args {
  const Screen1Args({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'Screen1Args{key: $key}';
  }
}

/// generated route for
/// [_i5.Screen2]
class Screen2 extends _i6.PageRouteInfo<void> {
  const Screen2() : super(Screen2.name, path: '/screen2');

  static const String name = 'Screen2';
}

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../model/restaurant_model/restaurant.dart' as _i10;
import '../ui/screen/auth_screen/login_screen.dart' as _i1;
import '../ui/screen/auth_screen/register_screen.dart' as _i2;
import '../ui/screen/main_screens/restaurant_detail.dart' as _i4;
import '../ui/screen/main_screens/root_screen.dart' as _i3;
import '../ui/screen/screen_1.dart' as _i6;
import '../ui/screen/screen_2.dart' as _i7;
import '../ui/screen/user_posts.dart' as _i5;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) {
      final args = routeData.argsAs<LoginScreenArgs>(
          orElse: () => const LoginScreenArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginScreen(key: args.key));
    },
    RegisterScreen.name: (routeData) {
      final args = routeData.argsAs<RegisterScreenArgs>(
          orElse: () => const RegisterScreenArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.RegisterScreen(key: args.key));
    },
    RootScreen.name: (routeData) {
      final args = routeData.argsAs<RootScreenArgs>(
          orElse: () => const RootScreenArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RootScreen(key: args.key));
    },
    RestaurantDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RestaurantDetailRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RestaurantDetailPage(key: args.key, res: args.res));
    },
    UserPosts.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.UserPosts());
    },
    Screen1.name: (routeData) {
      final args =
          routeData.argsAs<Screen1Args>(orElse: () => const Screen1Args());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.Screen1(key: args.key));
    },
    Screen2.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.Screen2());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        _i8.RouteConfig(LoginScreen.name, path: '/login'),
        _i8.RouteConfig(RegisterScreen.name, path: '/register'),
        _i8.RouteConfig(RootScreen.name, path: '/root'),
        _i8.RouteConfig(RestaurantDetailRoute.name, path: '/restaurantDetail'),
        _i8.RouteConfig(UserPosts.name, path: '/user_post'),
        _i8.RouteConfig(Screen1.name, path: '/screen1'),
        _i8.RouteConfig(Screen2.name, path: '/screen2')
      ];
}

/// generated route for
/// [_i1.LoginScreen]
class LoginScreen extends _i8.PageRouteInfo<LoginScreenArgs> {
  LoginScreen({_i9.Key? key})
      : super(LoginScreen.name,
            path: '/login', args: LoginScreenArgs(key: key));

  static const String name = 'LoginScreen';
}

class LoginScreenArgs {
  const LoginScreenArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'LoginScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.RegisterScreen]
class RegisterScreen extends _i8.PageRouteInfo<RegisterScreenArgs> {
  RegisterScreen({_i9.Key? key})
      : super(RegisterScreen.name,
            path: '/register', args: RegisterScreenArgs(key: key));

  static const String name = 'RegisterScreen';
}

class RegisterScreenArgs {
  const RegisterScreenArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RegisterScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RootScreen]
class RootScreen extends _i8.PageRouteInfo<RootScreenArgs> {
  RootScreen({_i9.Key? key})
      : super(RootScreen.name, path: '/root', args: RootScreenArgs(key: key));

  static const String name = 'RootScreen';
}

class RootScreenArgs {
  const RootScreenArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RootScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.RestaurantDetailPage]
class RestaurantDetailRoute
    extends _i8.PageRouteInfo<RestaurantDetailRouteArgs> {
  RestaurantDetailRoute({_i9.Key? key, required _i10.Data res})
      : super(RestaurantDetailRoute.name,
            path: '/restaurantDetail',
            args: RestaurantDetailRouteArgs(key: key, res: res));

  static const String name = 'RestaurantDetailRoute';
}

class RestaurantDetailRouteArgs {
  const RestaurantDetailRouteArgs({this.key, required this.res});

  final _i9.Key? key;

  final _i10.Data res;

  @override
  String toString() {
    return 'RestaurantDetailRouteArgs{key: $key, res: $res}';
  }
}

/// generated route for
/// [_i5.UserPosts]
class UserPosts extends _i8.PageRouteInfo<void> {
  const UserPosts() : super(UserPosts.name, path: '/user_post');

  static const String name = 'UserPosts';
}

/// generated route for
/// [_i6.Screen1]
class Screen1 extends _i8.PageRouteInfo<Screen1Args> {
  Screen1({_i9.Key? key})
      : super(Screen1.name, path: '/screen1', args: Screen1Args(key: key));

  static const String name = 'Screen1';
}

class Screen1Args {
  const Screen1Args({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'Screen1Args{key: $key}';
  }
}

/// generated route for
/// [_i7.Screen2]
class Screen2 extends _i8.PageRouteInfo<void> {
  const Screen2() : super(Screen2.name, path: '/screen2');

  static const String name = 'Screen2';
}

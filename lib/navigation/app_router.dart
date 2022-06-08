import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_example/ui/screen/auth_screen/login_screen.dart';
import 'package:flutter_bloc_example/ui/screen/auth_screen/register_screen.dart';
import 'package:flutter_bloc_example/ui/screen/main_screens/restaurant_detail.dart';
import 'package:flutter_bloc_example/ui/screen/main_screens/root_screen.dart';
import 'package:flutter_bloc_example/ui/screen/screen_1.dart';
import 'package:flutter_bloc_example/ui/screen/screen_2.dart';
import 'package:flutter_bloc_example/ui/screen/user_posts.dart';

import 'route_name.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(path: RouteName.loginScreen, page: LoginScreen, initial: true),
  AutoRoute(path: RouteName.registerScreen, page: RegisterScreen),
  AutoRoute(path: RouteName.rootScreen, page: RootScreen),
  AutoRoute(path: RouteName.restaurantDetail, page: RestaurantDetailPage),
  AutoRoute(path: '/user_post', page: UserPosts),
  AutoRoute(path: '/screen1', page: Screen1),
  AutoRoute(path: '/screen2', page: Screen2)
])
class $AppRouter {}

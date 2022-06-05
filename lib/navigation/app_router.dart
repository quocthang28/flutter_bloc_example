import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_example/ui/screen/screen_1.dart';
import 'package:flutter_bloc_example/ui/screen/screen_2.dart';
import 'package:flutter_bloc_example/ui/screen/user_posts.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(path: '/user_post', page: UserPosts, initial: true),
  AutoRoute(path: '/screen1', page: Screen1),
  AutoRoute(path: '/screen2', page: Screen2)
])
class $AppRouter {}

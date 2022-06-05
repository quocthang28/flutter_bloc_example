import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/navigation/app_router.gr.dart';
import 'package:flutter_bloc_example/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'bloc/user_post/user_post_bloc.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserPostBloc(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const UserPosts(title: 'Flutter Demo Home Page'),
        routerDelegate: GetIt.I<AppRouter>().delegate(),
        routeInformationParser: GetIt.I<AppRouter>().defaultRouteParser(),
      ),
    );
  }
}

import 'package:flutter_bloc_example/navigation/app_router.gr.dart';
import 'package:flutter_bloc_example/repository/post_repository.dart';
import 'package:flutter_bloc_example/repository/restaurant_repository.dart';
import 'package:flutter_bloc_example/repository/user_repository.dart';
import 'package:flutter_bloc_example/service/dio.dart';
import 'package:flutter_bloc_example/service/post/post_service.dart';
import 'package:flutter_bloc_example/service/restaurant_service/restaurant_service.dart';
import 'package:flutter_bloc_example/service/user_service.dart';
import 'package:get_it/get_it.dart';

void setupDependencies() {
  GetIt.I.registerSingleton(DioModule());

  GetIt.I.registerSingleton(AppRouter());

  GetIt.I.registerLazySingleton<PostService>(() => PostService(GetIt.I.get<DioModule>().dio));
  GetIt.I.registerLazySingleton<UserService>(() => const UserService());
  GetIt.I.registerLazySingleton<PostRepository>(() => PostRepository());
  GetIt.I.registerLazySingleton<UserRepository>(() => UserRepository());

  GetIt.I.registerLazySingleton<RestaurantService>(() => RestaurantService(GetIt.I.get<DioModule>().dio));
  GetIt.I.registerLazySingleton<RestaurantRepository>(() => RestaurantRepository());
}

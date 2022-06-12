import 'package:flutter_bloc_example/model/restaurant_menu/restaurant_menu.dart';
import 'package:flutter_bloc_example/model/restaurant_model/comment.dart';
import 'package:flutter_bloc_example/model/restaurant_model/recommended.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant_v2.dart';
import 'package:flutter_bloc_example/service/restaurant_service/restaurant_service.dart';
import 'package:get_it/get_it.dart';

class RestaurantRepository {
  final RestaurantService _restaurantService = GetIt.I<RestaurantService>();

  Future<Restaurant> getRestaurant(String pageIndex, String pageSize, String currentPage) {
    return _restaurantService.getRestaurants(pageIndex, pageSize, currentPage);
  }

  Future<Menu> getMenu(String resId) {
    return _restaurantService.getMenu(resId);
  }

  Future<ResComment> getResComment(String resId) {
    return _restaurantService.getComments(resId);
  }

  Future<RecommendedRestaurant> getRecommendedRestaurant(String resId) {
    return _restaurantService.getRecommendedRestaurants(resId);
  }

  Future<RestaurantV2> getMostViewedRestaurants() {
    return _restaurantService.getMostViewedRestaurants();
  }

  Future<RestaurantV2> getNearbyRestaurants() {
    return _restaurantService.getNearbyRestaurants();
  }

  Future<Restaurant> getRestaurantBySearchTerm(Map<String, dynamic> map) {
    return _restaurantService.getRestaurantBySearchTerm(map);
  }
}

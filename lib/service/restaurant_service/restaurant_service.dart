import 'package:dio/dio.dart';
import 'package:flutter_bloc_example/constant/api_endpoint.dart';
import 'package:flutter_bloc_example/model/restaurant_menu/restaurant_menu.dart';
import 'package:flutter_bloc_example/model/restaurant_model/comment.dart';
import 'package:flutter_bloc_example/model/restaurant_model/recommended.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant.dart';
import 'package:flutter_bloc_example/model/restaurant_model/restaurant_v2.dart';
import 'package:retrofit/retrofit.dart';

part 'restaurant_service.g.dart';

@RestApi()
abstract class RestaurantService {
  factory RestaurantService(Dio dio) = _RestaurantService;

  @GET(ApiEndpoint.getRestaurant)
  Future<Restaurant> getRestaurants(@Query('pageIndex') String pageIndex, @Query('pageSize') String pageSize,
      @Query('currentPage') String currentPage);

  @GET(ApiEndpoint.getRestaurantMenu + '/{resId}')
  Future<Menu> getMenu(@Path() String resId);

  @GET('/comment/{resId}')
  Future<ResComment> getComments(@Path() String resId);

  @GET('/restaurant/recommend/{resId}')
  Future<RecommendedRestaurant> getRecommendedRestaurants(@Path() String resId);

  @POST('/restaurant/mostview')
  Future<RestaurantV2> getMostViewedRestaurants();

  @POST('/restaurant/nearly')
  Future<RestaurantV2> getNearbyRestaurants();

  @POST('restaurant/search')
  Future<Restaurant> getRestaurantBySearchTerm(@Body() Map<String, dynamic> map);
}

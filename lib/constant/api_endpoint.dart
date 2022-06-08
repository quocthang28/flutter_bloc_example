class ApiEndpoint {
  ApiEndpoint._();

  //base paths
  static const String postBasePath = "/posts";

  static const String post = "/posts";

  static const String postDetail = postBasePath + "/postDetail";

  static const String getRestaurant = '/restaurant';
  static const String getRestaurantMenu = '/menu'; // + res id

  static const String getRestaurantMenuDetail = '/menu_detail'; // + menu id
}

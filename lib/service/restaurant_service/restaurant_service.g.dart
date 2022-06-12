// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestaurantService implements RestaurantService {
  _RestaurantService(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Restaurant> getRestaurants(pageIndex, pageSize, currentPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageIndex': pageIndex,
      r'pageSize': pageSize,
      r'currentPage': currentPage
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Restaurant>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/restaurant',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Restaurant.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Menu> getMenu(resId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Menu>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/menu/$resId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Menu.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResComment> getComments(resId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResComment>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/comment/$resId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResComment.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RecommendedRestaurant> getRecommendedRestaurants(resId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RecommendedRestaurant>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/restaurant/recommend/$resId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RecommendedRestaurant.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RestaurantV2> getMostViewedRestaurants() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RestaurantV2>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/restaurant/mostview',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RestaurantV2.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RestaurantV2> getNearbyRestaurants() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RestaurantV2>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/restaurant/nearly',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RestaurantV2.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Restaurant> getRestaurantBySearchTerm(map) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Restaurant>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'restaurant/search',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Restaurant.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}

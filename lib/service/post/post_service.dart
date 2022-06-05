import 'package:dio/dio.dart';
import 'package:flutter_bloc_example/constant/api_endpoint.dart';
import 'package:flutter_bloc_example/model/post/post.dart';
import 'package:retrofit/retrofit.dart';

part 'post_service.g.dart';

@RestApi()
abstract class PostService {
  factory PostService(Dio dio) = _PostService;

  @GET(ApiEndpoint.postBasePath)
  Future<List<Post>> getUserPosts();
}

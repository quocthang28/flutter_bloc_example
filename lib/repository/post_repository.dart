import 'package:flutter_bloc_example/model/post/post.dart';
import 'package:flutter_bloc_example/service/post/post_service.dart';
import 'package:get_it/get_it.dart';

class PostRepository {
  final PostService _postService = GetIt.I<PostService>();

  Future<List<Post>> getUserPosts() {
    return _postService.getUserPosts();
  }
}

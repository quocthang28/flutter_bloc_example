import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/model/post/post.dart';
import 'package:flutter_bloc_example/repository/post_repository.dart';
import 'package:get_it/get_it.dart';

part 'user_post_event.dart';
part 'user_post_state.dart';

class UserPostBloc extends Bloc<UserPostEvent, UserPostsState> {
  final PostRepository postRepository = GetIt.I<PostRepository>();

  UserPostBloc() : super(UserPostsEmpty()) {
    on<GetUserPosts>((event, emit) async {
      emit(UserPostsLoading());
      await postRepository
          .getUserPosts()
          .then((value) => emit(value.isEmpty ? UserPostsEmpty() : UserPostsLoaded(posts: value)))
          .onError((error, stackTrace) => emit(UserPostsError()));
    });
  }

  @override
  onChange(change) {
    super.onChange(change);
    print(change.toString());
  }

  @override
  void onTransition(Transition<UserPostEvent, UserPostsState> transition) {
    super.onTransition(transition);
    print(transition.toString());
  }
}

part of 'user_post_bloc.dart';

abstract class UserPostEvent extends Equatable {
  const UserPostEvent();
}

class GetUserPosts extends UserPostEvent {
  const GetUserPosts();

  @override
  List<Object> get props => [];
}

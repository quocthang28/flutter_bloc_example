part of 'user_post_bloc.dart';

abstract class UserPostsState extends Equatable {
  const UserPostsState();

  @override
  List<Object> get props => [];
}

class UserPostsEmpty extends UserPostsState {}

class UserPostsLoading extends UserPostsState {}

class UserPostsLoaded extends UserPostsState {
  final List<Post> posts;

  const UserPostsLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

class UserPostsError extends UserPostsState {}

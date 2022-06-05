import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/user_post/user_post_bloc.dart';
import 'package:flutter_bloc_example/model/post/post.dart';
import 'package:flutter_bloc_example/navigation/route_name.dart';
import 'package:flutter_bloc_example/ui/screen/screen_1.dart';
import 'package:flutter_bloc_example/ui/screen/screen_2.dart';
import 'package:velocity_x/velocity_x.dart';

class UserPosts extends StatefulWidget {
  const UserPosts({Key? key}) : super(key: key);

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('aaaaaaa'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                child: 'go to screen 2'.text.make(),
                //onPressed: () => context.router.pushNamed(RouteName.screen1)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen2Bloc()))),
            Expanded(
              child: BlocBuilder<UserPostBloc, UserPostsState>(
                builder: (BuildContext context, UserPostsState state) {
                  if (state is UserPostsEmpty) {
                    //BlocProvider.of<UserPostBloc>(context).add(const GetUserPosts());
                    // context.watch<UserPostBloc>().add(const GetUserPosts());
                    return Container();
                  } else if (state is UserPostsLoaded) {
                    return UserPostsList(userPosts: state.posts);
                  } else if (state is UserPostsError) {
                    return 'sumthing wong'.text.make();
                  }
                  //UserPostsLoading
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<UserPostBloc>(context).add(const GetUserPosts());
  }
}

class UserPostsList extends StatelessWidget {
  final List<Post> userPosts;

  const UserPostsList({required this.userPosts, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userPosts.length,
      itemBuilder: (context, index) => ListTile(
        title: userPosts[index].title!.text.make(),
        subtitle: userPosts[index].body!.text.make(),
      ),
    );
  }
}

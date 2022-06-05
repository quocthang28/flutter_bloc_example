import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/user/user_bloc.dart';
import 'package:flutter_bloc_example/model/user.dart';
import 'package:velocity_x/velocity_x.dart';

class Screen2Bloc extends StatelessWidget {
  const Screen2Bloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: const Screen2(),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const UserInputTextField().h10(context),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state.users.isEmpty) {
                BlocProvider.of<UserBloc>(context).add(const UserRequested());
                if (state.status == UserStatus.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.status != UserStatus.success) {
                  return const SizedBox();
                } else if (state.status == UserStatus.failure) {
                  return const Text('Something is wrong!!!');
                }
              }
              return ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.users[index].name,
                      style: const TextStyle(fontSize: 25),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
                itemCount: state.users.length,
              ).expand();
            },
          ),
        ],
      ),
    );
  }
}

class UserInputTextField extends StatelessWidget {
  const UserInputTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: const InputDecoration(
          label: Text('Add User'),
        ),
        // onChanged: (input) {
        //   context.read<UserBloc>().add(UserInputChanged(input));
        // },
        onSubmitted: (input) {
          context.read<UserBloc>().add(UserAdded(User(input)));
        });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/model/user.dart';
import 'package:flutter_bloc_example/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<UserRequested>(_onUserRequested);
    on<UserAdded>(_onUserAdded);
    on<UserInputChanged>(_onUserInputChanged);
  }

  final UserRepository _repository = GetIt.I<UserRepository>();

  Future<void> _onUserRequested(
    UserRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));

    /// We also could have used `stream.listen` however `emit.forEach()` is a
    /// newer and recommended approach when working with the flutter_bloc package.

    _repository.getUsers();

    await emit.forEach<List<User>>(
      _repository.userStream,
      onData: (users) => state.copyWith(
        status: UserStatus.success,
        users: users,
      ),
      onError: (_, __) => state.copyWith(status: UserStatus.failure),
    );
  }

  void _onUserAdded(
    UserAdded event,
    Emitter<UserState> emit,
  ) {
    _repository.addUser(event.user);
    emit(state.copyWith(userInput: ''));
  }

  void _onUserInputChanged(
    UserInputChanged event,
    Emitter<UserState> emit,
  ) {
    emit(
      state.copyWith(
        userInput: event.input,
      ),
    );
  }
}

import 'package:flutter_bloc_example/model/user.dart';

class UserService {
  const UserService();

  /// This class, in a real project is supposed to make network requests to
  /// the server to get the data. But here we will just return our hard-coded
  /// list of users `List<User>`.
  Future<List<User>> getUsers() async {
    // make a network request
    await Future.delayed(const Duration(seconds: 5)); // mimicking network delay
    return allUsers;
  }
}

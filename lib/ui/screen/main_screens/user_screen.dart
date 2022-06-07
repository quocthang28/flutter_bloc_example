import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: 'user screen'.text.make(),
      ),
    );
  }
}

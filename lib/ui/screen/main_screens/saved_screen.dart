import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: 'saved'.text.make(),
      ),
    );
  }
}

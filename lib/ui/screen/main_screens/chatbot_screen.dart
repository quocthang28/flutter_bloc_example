import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: 'chatbot'.text.make(),
      ),
    );
  }
}

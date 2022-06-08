import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).viewPadding.top,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppColor.mainColor.withOpacity(0.8), AppColor.mainColor]),
            ),
          ),
          Container(
            child: 'chatbot'.text.make(),
          ),
        ],
      ),
    );
  }
}

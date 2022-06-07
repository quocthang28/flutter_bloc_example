import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).viewPadding.top,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [AppColor.mainColor.withOpacity(0.8), AppColor.mainColor]),
          ),
        ),
        50.heightBox,
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.onTap, required this.label}) : super(key: key);

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.deepOrangeAccent, borderRadius: BorderRadiusDirectional.circular(5)),
        child: label.text.white.semiBold.size(16).make().p(10).centered(),
      ),
    );
  }
}

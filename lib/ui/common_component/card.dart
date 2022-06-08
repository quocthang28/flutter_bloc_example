import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';

class AppCard extends StatelessWidget {
  const AppCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          border: Border.all(color: AppColor.mainColor, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: AppColor.mainColor.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(2, 4), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          child: child,
        ),
      ),
    );
  }
}

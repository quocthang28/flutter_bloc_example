import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';

showLoadingIndicator(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: SizedBox(
          width: 50.0,
          height: 50.0,
          child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColor.mainColor)),
        ),
      );
    },
  );
}

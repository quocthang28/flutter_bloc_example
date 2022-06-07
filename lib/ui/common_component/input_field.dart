import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.controller, required this.iconData, required this.hintText, this.inputType})
      : super(key: key);

  final TextEditingController controller;
  final IconData iconData;
  final String hintText;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType ?? TextInputType.text,
      obscureText: inputType == TextInputType.visiblePassword ? true : false,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      style: const TextStyle(color: AppColor.mainColor, fontSize: 14),
      cursorColor: AppColor.mainColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black54, fontSize: 14, fontStyle: FontStyle.italic),
        prefixIcon: Icon(
          iconData,
          color: AppColor.mainColor,
          size: 18,
        ),
        isDense: true,
        //contentPadding: EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.mainColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.mainColor),
        ),
      ),
    );
  }
}

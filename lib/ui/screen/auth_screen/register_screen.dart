import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/navigation/route_name.dart';
import 'package:flutter_bloc_example/ui/common_component/button.dart';
import 'package:flutter_bloc_example/ui/common_component/card.dart';
import 'package:flutter_bloc_example/ui/common_component/input_field.dart';
import 'package:flutter_bloc_example/ui/common_component/loading_indicator.dart';
import 'package:flutter_bloc_example/ui/ui_constant/app_color.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('background.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppCard(
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.center,
                          child: 'Đăng kí'.text.color(AppColor.mainColor).size(24).make()),
                      30.heightBox,
                      InputField(
                        controller: _emailController,
                        iconData: Icons.email_outlined,
                        hintText: 'Email',
                        inputType: TextInputType.emailAddress,
                      ),
                      20.heightBox,
                      InputField(
                        controller: _pwController,
                        iconData: Icons.lock_outlined,
                        hintText: 'Tên hiển thị',
                        inputType: TextInputType.text,
                      ),
                      20.heightBox,
                      InputField(
                        controller: _pwController,
                        iconData: Icons.lock_outlined,
                        hintText: 'Mật khẩu',
                        inputType: TextInputType.visiblePassword,
                      ),
                      20.heightBox,
                      InputField(
                        controller: _pwController,
                        iconData: Icons.lock_outlined,
                        hintText: 'Nhập lại mật khẩu',
                        inputType: TextInputType.visiblePassword,
                      ),
                      40.heightBox,
                      AuthButton(
                          onTap: () {
                            showLoadingIndicator(context);
                            Future.delayed(const Duration(seconds: 2))
                                .then((value) => context.router.pushNamed(RouteName.rootScreen));
                          },
                          label: 'Đăng kí'),
                      30.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          'Đã có tài khoản?'.text.color(Colors.black54).make(),
                          10.widthBox,
                          AuthButton(onTap: () => context.router.pushNamed(RouteName.loginScreen), label: 'Đăng nhập'),
                        ],
                      )
                    ],
                  ).px(15).py(40),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
